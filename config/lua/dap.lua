local dap = require('dap')
dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { '~/vscode-php-debug/out/phpDebug.js' }
}

dap.configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for Xdebug',
    port = 9000
  }
}

require('nvim-dap-virtual-text').setup()
require('dapui').setup()
