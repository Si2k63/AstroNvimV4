return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = function(plugin, opts)
    local config = require("astrocore").extend_tbl(opts.config or {}, {
      formatting = {
        format_on_save = {
          enabled = true,
          allow_filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
        },
      },
      tsserver = {
        root_dir = require("lspconfig.util").root_pattern("package.json", "tsconfig.json", ".git"),
        settings = {
          typescript = {
            workspaceFolders = {
              { path = "${workspaceFolder}" },
              { path = "${workspaceFolder}/src/common" },
            },
            sourceRoots = {
              "${workspaceFolder}/src",
              "${workspaceFolder}/src/common",
            },
          },
        },
        capabilities = {
          workspace = {
            workspaceFolders = {
              ignoreAncestors = false,
            },
          },
        },
      },
    })
    return { config = config }
  end,
}
