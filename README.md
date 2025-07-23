# nvcustom

🛠️ My custom configuration layer for [NvChad](https://github.com/NvChad/NvChad)

This repository contains my personal Neovim tweaks built on top of NvChad, including:

- 🧩 Additional plugins
- ⚙️ Custom plugin configurations
- 🗂️ Modular structure for easy maintenance

## Usage

Clone this repo into your NvChad config directory:

```bash
git clone https://github.com/toita86/nvcustom ~/.config/nvim/lua/nvcustom
````

Then import your custom modules inside `nvim/lua/plugins/init.lua` like:

```lua
{ import = "nvcustom.plugins" }
```

## Structure

```
nvcustom/
├── plugins.lua      -- Additional plugins
└── README.md
```

## License

MIT

