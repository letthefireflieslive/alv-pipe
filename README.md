# Allianz CICD Infra

# Requirements
- ansible 
- 16G memory
- `ansible-galaxy install andrewrothstein.kind`
# Install
This playbook will install
- Single node K8s Cluster via Kind
- Install Bitnami's Sealed Secret
- Istio
- ArgoCD, ArgoWorkflow, ArgoEvents
- Test Springboot Application

`ansible-playbook install.yml -K`

## Tested
- macOS Big Sur 11.6.2
- ansible 2.9.20
