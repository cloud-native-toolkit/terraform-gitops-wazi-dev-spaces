# Starter kit for a Terraform GitOps module


This is a terraform module to deploy Wazi DevSpaces.  This is a configuration of CodeReady Workspaces (Eclipse Che), preconfigured with Wazi development plugins.  

### Command-line tools

- terraform - v12
- kubectl

### Terraform providers

- IBM Cloud provider >= 1.5.3
- Helm provider >= 1.1.1 (provided by Terraform)

## Module dependencies

This module makes use of the output from other modules:

- GitOps - github.com/cloud-native-toolkit/terraform-tools-gitops.git
- Namespace - github.com/cloud-native-toolkit/terraform-gitops-namespace.git
- Wazi DevSpaces Operator - github.com/cloud-native-toolkit/terraform-gitops-wazi-ds-operator

## Example usage

```hcl-terraform
module "wazi_devspaces" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-wazi-dev-spaces.git"

  gitops_config = module.gitops.gitops_config
  git_credentials = module.gitops.git_credentials
  server_name = module.gitops.server_name
  namespace = module.gitops_namespace.name
  kubeseal_cert = module.gitops.sealed_secrets_cert
}

```
