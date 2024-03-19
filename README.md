# visidata.nvim

A plugin for neovim to render pandas dataframes in [nvim-dap][1] using the power of [visidata][2].


## Installation

- Requires [nvim-dap][1]
- Requires [visidata][3] to be available in the active python environment
- Install like any other neovim plugin:
```
    # Using: lazy
    {
         "Willem-J-an/visidata.nvim",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui"
        },
        config = function()
            local dap = require("dap")
            dap.defaults.fallback.external_terminal = {
                command = "<Path to your terminal of choice>",
                args = { "--hold", "--command" },
            }
            vim.keymap.set("v", "<leader>vp", require('visidata').visualize_pandas_df, { desc = "[v]isualize [p]andas df" })
        end,
    }
```


## Usage

1. Configure an external-terminal for nvim-dap
2. Configure a keymap to execute the visualize_pandas_df function.
3. Configure your dap session to use externalTerminal:
``` json
{
    "name": "Python: Current File",
    "type": "python",
    "request": "launch",
    "program": "${file}",
    "console": "externalTerminal"
}
```
4. Debug your code as usual, load a pandas dataframe, add a breakpoint after it.
5. Select the pandas dataframe and execute the keymap.


[1]: https://github.com/mfussenegger/nvim-dap
[2]: https://www.visidata.org/
[3]: https://www.visidata.org/install/
