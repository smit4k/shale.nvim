<h1 align='center'>
    shale.nvim
</h1>

<p align='center'>
  <b>A clean, dark, pleasant Neovim theme based on shale rocks</b>
</p>

<img src="shale-snapshot.png">


## Installation

Install using your favorite plugin manager

```lua
{
  "smit4k/shale.nvim",
}
```

Ex. setting shale as default colorscheme using lazy.nvim:
```lua
return {
  {
    "smit4k/shale.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("shale")
    end,
  },
}
```
