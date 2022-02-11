# UC CICD Infra Initializer

_K8s + Kaniko + Argo + Istio + Sealed Secrets_

### Disclaimer 
The project is young. 
This project is not intended for production use. 
It is meant for playground, demo or POC. We'll ge there.. .

# Goal
Create a DevOps pipeline.. live on its own, self healing and requires less attention. 

# Requirement
- ansible

# Provision Machine
## Option 1: Local
### Requirements
- 32G free memory 
- vagrant

```
cd provision/local
vagrant up
cd ../..
```

### Optional: Setup your /etc/hosts
append to your /etc/hosts (feel free to customize)

    55.55.55.55  box.local
    55.55.55.55  argo.box.local
    55.55.55.55  dev.box.local
    55.55.55.55  qa.box.local
    55.55.55.55  staging.box.local
#### Assumption: 55.55.55.55 is not in used

## Option 2: Linode
### Requirements
- linode subscription
- [personal access token](https://www.linode.com/docs/products/tools/linode-api/guides/get-access-token/) 
  with read/write access to Linodes
- terraform CLI

1. `cd provision/linode`
2. create a tfvars file  `./provision/linode/demo.tfvars` and populate the values
    ```
    authorized_keys  = [""]
    root_pass = ""
    token = ""
    ```

3. Check what will be applied

   `terraform plan -var-file=demo.tfvars`
4. Validate the tf files format

   `terraform validate` 
5. Create the resource

   `terraform apply -var-file=demo.tfvars `
6. Extract the public IP

   `public_ip=$(terraform output | cut -d \" -f2)`

7. Go back to root of project `cd ../..`

9. Update IPs
    ```
    sed -i -e "s/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/$public_ip/g" inventory/remote
    sed -i -e "s/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/$public_ip/g" playbook/install-istio/cluster-gateway-remote.yml
    sed -i -e "s/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/$public_ip/g" playbook/install-istio/smoke-test.yml
    sed -i -e "s/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/$public_ip/g" playbook/install-argo-cd/manifest-istio-virtualservice-remote.yml
    ```


# Install
## Install Dependencies
`ansible-galaxy install -r requirements.yml`
## Install K8s, Istio, Sealed Secret, Argo
### Option 1: Local
`ansible-playbook setup.yml -i inventory/local`
### Option 2: Remote
`ansible-playbook setup.yml -i inventory/remote`

# Components
- docker ce-20.10.12
- kind v0.11.1 
- k8s v1.21.1
- install kubeseal v0.16.0
- install bitnami sealed secret v0.17.3
- istio v1.12.1
- argo v2.2.25+8

### Recommended and Optional 
[Install Argo CD CLI](https://argo-cd.readthedocs.io/en/stable/cli_installation/)

## Login
### Local
`argocd login argo.box.local` or via browser 
### Remote
`argocd login $public_ip/argo` or via browser 

#### Get the password
Get the initial admin password from _TASK [ Retrieve default 'admin' password ]_ ansible playbook task output 

#### Change password
`argocd account update-password`

# Issues

> "Request failed: <urlopen error [Errno -2] Name or service not known>"


**Solution**: Just run your playbook again, it's idempotent anyway :)

## Tested
- macOS Big Sur 11.6.2 (ansible runner)
- vagrant 2.2.18
- virtualbox 6.1.28
- ansible 2.9.20

## Todos
- Deploy sample application
- Use kubectl only, remove helm and istioctl
- Convert Plays to Ansible Roles
- Standardize Manifest names
- Use kustomize to abstract local and remote host configs


