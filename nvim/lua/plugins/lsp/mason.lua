-- mason 配置
require("mason-lspconfig").setup(
    {
        ensure_installed = {}
    }
)

require("mason").setup(
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
