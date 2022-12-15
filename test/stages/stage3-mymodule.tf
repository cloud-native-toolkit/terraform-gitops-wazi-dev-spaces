module "wazi_devspaces" {
  source = "./module"
  depends_on = [
    module.dev_software_olm,
    module.gitops_namespace,
    module.gitops-bootstrap,
    module.wazi_devspaces_operator
  ]

  gitops_config = module.gitops.gitops_config
  git_credentials = module.gitops.git_credentials
  server_name = module.gitops.server_name
  namespace = module.gitops_namespace.name
  kubeseal_cert = module.gitops.sealed_secrets_cert
}
