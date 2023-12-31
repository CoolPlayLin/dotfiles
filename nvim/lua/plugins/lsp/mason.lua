local mason_status, mason = pcall(require, "mason")
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not (mason_lspconfig_status or mason_status) then
  return
end

mason_lspconfig.setup(
    {
        ensure_installed = {}
    }
)

mason.setup(
    {
        ui = {
            icons = {
                package_pending = "→",
                package_installed = "√",
                package_uninstalled = "×"
            }
        }
    }
)
