local languageServerPath = "/opt/homebrew/lib/"
local cmd =
  { "ngserver", "--stdio", "--tsProbeLocations", languageServerPath, "--ngProbeLocations", languageServerPath }

return {
  cmd = cmd,
  on_new_config = function(new_config)
    new_config.cmd = cmd
  end,
}
