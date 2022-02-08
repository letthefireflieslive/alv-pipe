# DreamPipe CICD Infra Initializer

_K8s + Kaniko + Argo + Istio + Sealed Secrets_

### Disclaimer 
This project is not intended for production use. 
It is meant for playground, demo or POC.  

# Requirement
- ansible

# Install Playbook Dependencies
`ansible-galaxy install -r requirements.yml`

# Provision Machine
## Option 1: Local
### Requirements
- 32G free memory 
- vagrant

```
cd provision/local
vagrant up
```

### Optional: Setup your /etc/hosts
feel free to customize

    55.55.55.55  box.local
    55.55.55.55  argo.box.local
    55.55.55.55  dev.box.local
    55.55.55.55  qa.box.local
    55.55.55.55  staging.box.local
#### Assumption: 55.55.55.55 is not in used

## Option 2: Linode
### Requirements
- 32G free memory 
- terraform CLI

```
terraform plan
terraform apply
```

# Install
## Prerequisite
Update your ansible host at `./inventory/*`

## Install K8s, Istio, Sealed Secret, Argo
### Option 1: Local
`ansible-playbook setup.yml -i inventory/local`
### Option 2: Remote
`ansible-playbook setup.yml -i inventory/remote`
### Option 3: Existing cluster
#### Prerequisite
- kubeconfig that has necessary permissions
  - create namespace
  - write access to istio namespace

`ansible-playbook setup.yml -i inventory/remote --skip-tags docker,kind -e kubeconfig=./kubeconfig-path`

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
`argocd login argo.box.local` or via browser `argo.box.local`

#### Get the password
Get the initial admin password from _TASK [ Retrieve default 'admin' password ]_ ansible playbook task output 

#### Change password
`argocd account update-password`

# Issues

> "Request failed: <urlopen error [Errno -2] Name or service not known>"


**Solution**: Just run your playbook again, it's idempotent anyway :)

## Tested
- macOS Big Sur 11.6.2
- vagrant 2.2.18
- virtualbox 6.1.28
- ansible 2.9.20

## Todos
- Use kubectl only, remove helm and istioctl
- Convert Plays to Ansible Roles
- Handle remote VM provisioning
- Deploy sample application
- Standardize Manifest names
- Handle AWS|Azure|GCP provisioning & deployment

