# Allianz CICD Infra

# Requirements
- vagrant
- ansible 
- 16G memory

# Create Machine
`vagrant up`

# Install Playbook Dependencies
`ansible-galaxy install -r requirements.yml && 
ansible-galaxy collection install -r requirements.yml -p ~/.ansible/collections`

# Setup
`ansible-playbook setup.yml -i inventory/local`

this will install 
- docker ce-20.10.12
- single node K8s Cluster via Kind v0.11.1
- install kubeseal v0.16.0
- install bitnami sealed secret v0.17.3
- istio vX
- argoCD, ArgoWorkflow, ArgoEvents vX
- test Springboot Application


## Optional 
Running specific play

`ansible-playbook setup.yml -i inventory/local --tags [vm,k8s,ss]`

## Tested
- macOS Big Sur 11.6.2
- vagrant 2.2.18
- virtualbox 6.1.28
- ansible 2.9.20
