module "wazi_devspaces_operator" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-wazi-dev-spaces-operator.git"
  depends_on = [
    module.dev_software_olm,
    module.gitops_namespace,
    module.gitops-bootstrap
  ]

  gitops_config = module.gitops.gitops_config
  git_credentials = module.gitops.git_credentials
  server_name = module.gitops.server_name
  namespace = module.gitops_namespace.name
  kubeseal_cert = module.gitops.sealed_secrets_cert
}