# Kanirgo CICD Infra Initializer

_VirtualBox + K8s + Kaniko + Argo + Istio + Sealed Secrets_

NOTE: This is currently designed to work for your local machine

# Requirements

- vagrant
- ansible 
- 32G free memory (untested estimate)

```diff
+  working fine with 13G free memory and no apps deployed yet
-   shuts down my 16G laptop when I start deploying apps in Argo CRD :(
```  

# Create Machine
`vagrant up`

# Install Playbook Dependencies
`ansible-galaxy install -r requirements.yml`

# Setup
`ansible-playbook setup.yml -i inventory/local`

this will install 
- docker ce-20.10.12
- kind v0.11.1 
- k8s v1.21.1
- install kubeseal v0.16.0
- install bitnami sealed secret v0.17.3
- istio v1.12.1
- argo v2.2.25+8


###  Optional: Running specific play

`ansible-playbook setup.yml -i inventory/local --tags [kind,docker,k8s,ss,argo]`

### Optional: Setup your /etc/hosts 
feel free to customize

    55.55.55.55  box.local
    55.55.55.55  argo.box.local
    55.55.55.55  dev.box.local
    55.55.55.55  qa.box.local
    55.55.55.55  staging.box.local
#### Assumption: 55.55.55.55 is not in used

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
- Handle remote VM provisioning
- Deploy sample application
- Standardize Manifest names
- Convert Plays to Ansible Roles
- Handle AWS|Azure|GCP provisioning & deployment

