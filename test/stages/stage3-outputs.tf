
resource local_file write_outputs {
  filename = "gitops-output.json"

  content = jsonencode({
    name        = module.wazi_devspaces.name
    branch      = module.wazi_devspaces.branch
    namespace   = module.wazi_devspaces.namespace
    server_name = module.wazi_devspaces.server_name
    layer       = module.wazi_devspaces.layer
    layer_dir   = module.wazi_devspaces.layer == "infrastructure" ? "1-infrastructure" : (module.gitops_module.layer == "services" ? "2-services" : "3-applications")
    type        = module.wazi_devspaces.type
  })
}
