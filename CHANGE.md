# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased] - 2022-Feb-11

### Added
- Fetch admin kubeconfig from host to ansible runner
- Convert playbook to ansible roles 

## [1.1.2] - 2022-Feb-11

### Removed
- Creation of Staging and Production Argo projects. Will be moving it to 
  [sample-argo-project-1](https://github.com/letthefireflieslive/sample-argo-project-1)

## [1.1.1] - 2022-Feb-11

### Added
- Fetch admin kubeconfig from host to ansible runner

## [1.1.0] - 2022-Feb-11

### Added
- Support linode VM provisioning via terraform
- Script for replacing files that depends on the generated public IP of the remote VM
- Deployment of sample nginx application with istio VS and GW configured for access http://{public_ip}/smoke

### Changed
- Change OS user `vagrant` to `t1`

## [1.0.0] - 2022-Feb-08

### Added
- Local installation
