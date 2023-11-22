local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local workspace_dir = '/path/to/workspace-root/' .. project_name

local config = {
  cmd = {
    'C:\\Program Files\\Java\\jdk-17\\bin\\java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens',
    'java.base/java.util=ALL-UNNAMED',
    '--add-opens',
    'java.base/java.lang=ALL-UNNAMED',
    '-jar',
    'C:\\Users\\OliverSchrader\\AppData\\Local\\nvim-data\\mason\\packages\\jdtls\\plugins\\org.eclipse.equinox.launcher_1.6.500.v20230622-2056.jar',
    '-configuration',
    'C:\\Users\\OliverSchrader\\AppData\\Local\\nvim-data\\mason\\packages\\jdtls\\config_win',
    '-data',
    workspace_dir
  },
  root_dir = require('jdtls.setup').find_root({ '.m2' }),
  settings = {
    java = {
      signatureHelp = {
        enabled = true,
        description = {
          enabled = true,
        }
      },
    }
  },
  init_options = {
    bundles = {},
    extendedClientCapabilities = {
      classFileContentsSupport = true,
    }
  },
}

require('jdtls').start_or_attach(config)
