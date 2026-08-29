# nvcustom

My custom configuration layer for [NvChad](https://github.com/NvChad/NvChad).

## Usage

Clone this repository into the `lua` directory of your NvChad configuration:

```bash
git clone https://github.com/toita86/nvcustom ~/.config/nvim/lua/nvcustom
```

The small adapter files in the NvChad starter configuration load these
modules. Keep those adapters when creating a new environment, or add the same
imports to your own starter configuration.

The plugin entry point loads the custom plugin, LSP, and DAP specifications:

```lua
{ import = "nvcustom.plugins" },
{ import = "nvcustom.lsp" },
{ import = "nvcustom.dap" },
```

## Structure

```text
nvcustom/
├── chadrc.lua       -- Theme and NvChad UI settings
├── options.lua      -- Editor options
├── mappings.lua     -- Personal keymaps
├── autocmds.lua     -- Personal autocmds
├── configs/         -- Plugin-specific configuration
├── plugins.lua      -- Plugin specifications
├── lsp.lua          -- LSP configuration
├── dap.lua          -- Debug adapter configuration
└── README.md
```

Mason automatically installs the configured formatters: `black`, `mdformat`,
and `stylua`. Use `:ConformInfo` to see which formatter Conform is using for
the current buffer.

Search and replace is provided by Spectre:

- `<Space>sr` searches and replaces in the current buffer.
- `<Space>sR` searches and replaces across the project.
- `<Space>sw` searches and replaces the current selection or word.

`<Space>tt` toggles between the two themes listed in
`lua/nvcustom/mappings.lua`. Change the `toggle_themes` list there to choose
your own pair.

## License

MIT
