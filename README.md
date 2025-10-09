<h4 align="center">
  <img src="https://raw.githubusercontent.com/neverglade/neverglade/main/assets/logos/exports/ebony.png" width="100px"> <br>
  Neverglade for <a href="https://github.com/neovim/neovim">Neovim</a>
</h4>

<p align="center">
<img width="600" alt="NVIM" src="https://github.com/user-attachments/assets/39282ee6-b169-46de-bbc4-bf97a2c0d356" />  
</p>



<p align="center">
  Neverglade comes in 3 varieties, each with 22 medium-contrast colours. It aims to be a calming and focused theme based around the colour green. It makes minimal use of accent colours outside of syntax. Integrations are provided for a number of popular Neovim plugins.
  
</p>

<p align="center"><i>This is the premier Neverglade project. Although the aim of Neverglade is to never let a port languish, this port will receive updates the fastest and acts as a testing bed for colour changes.</i></p>

## Previews
<details>
  <summary>Ebony</summary>
    <img width="1470" height="923" alt="Screenshot 2025-10-09 at 07 22 55" src="https://github.com/user-attachments/assets/88e271ce-69da-4865-ae4b-4d1f304ca149" />

  </details>
  <details>
    <summary>Oak</summary>
<img width="1470" height="923" alt="Screenshot 2025-10-09 at 07 22 39" src="https://github.com/user-attachments/assets/c9da6a02-2ec3-4272-9452-88482101550a" />

  </details>
  <details>
    <summary>Birch</summary>  
<img width="1470" height="923" alt="Screenshot 2025-10-09 at 07 22 17" src="https://github.com/user-attachments/assets/f8f619ef-8621-4ae9-87b5-2ca663e6aaf6" />
  </details>

## Features
- Support for other applications
- Integrations with various plugins
- Transparent background support



## Installation
[lazy.nvim](https://github.com/folke/lazy.nvim)
```lua
{ "neverglade/nvim", name="neverglade", lazy = false }
```

## Usage 
```vim
colorscheme neverglade " neverglade-ebony neverglade-oak neverglade-birch
```

```lua
vim.cmd.colorscheme "neverglade"
```

## Configuration
Defaults are provided for all configuration options. Unless you want to change configuration options calling setup is not required.
```lua
require("neverglade").setup({
  variety = "oak", -- Controls the scheme variety: ebony, oak, or birch  
  transparent_background = false, -- Whether backgrounds should be transparent
  italics = true, -- Controls italics within syntax highlighting (e.g. func)
  italic_comments = true, -- Whether comments are italicisized

  show_eob = false, -- Whether the EOB (End of Buffer) is shown
  diagnostics = {
    text = false, -- Whether diagnostic styles should be applied to text
    virtual = "colored", -- Virtual text diagnostics colour, "gray" or "colored"
  },
  terminal = true, -- Whether to set the vim termcolors
  default_integrations = true, -- Whether to use the default integrations
  integrations = { -- Integrations table, default values controlled by the option above
    telescope = true,
    which_key = true,
    blink_cmp = true,
    mason = true,
    neotree = true,
  },
})
```

## Integrations
Neverglade dynamically loads highlight groups based on the `integrations` table within the configuration. To enable/disable an integration, just set its boolean value.
```lua
require("neverglade").setup({
  integrations = {
    neotree = false
  }
})
```
Integrations for popular plugins (e.g. `which-key`, `mason`, and `neotree`) are enabled by default. To disable this behaviour, set `default_integrations` to false.

*A full list of integrations will be provided in the README soon, but for now one can view available integrations via `./lua/neverglade/groups/integrations/*.lua`*.

## Caveats
This is the section where I temper expectations. I do, from the bottom of my heart, believe I have created a very good colour scheme. However! I am not a Neovim plugin author. This plugin was a learning process for me, cobbled together with the code of `everforest-nvim`. `catppuccin` and `rose-pine` as reference. If any experienced plugin authors take an interest in this theme, please feel free to call me stupid and wrong!

## Thanks
A huge thanks to [sainnhe](https://github.com/sainnhe). His [Everforest](https://github.com/sainnhe/everforest) scheme for Vim was the direct inspiration for the entire Neverglade project. Some additional thanks to the maintainers of the [Catppuccin](https://github.com/catppuccin) theme. Their code was used extensively as a reference for theme plugin development and integrations. I also shamelessly ripped off their `README.md`.





