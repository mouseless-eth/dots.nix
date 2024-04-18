{
  pkgs,
  lib,
  ...
}: let
  concatFiles = files: pkgs.lib.strings.concatMapStringsSep "\n" builtins.readFile files;
  readFile = file: builtins.readFile file;

  /*
  = = custom pacakges = =
  */
  fromGitHub = owner: repo: rev: hash:
    pkgs.vimUtils.buildVimPlugin {
      pname = "${lib.strings.sanitizeDerivationName repo}";
      version = rev;
      src = pkgs.fetchFromGitHub {
        owner = owner;
        repo = repo;
        rev = rev;
        hash = hash;
      };
    };
in {
  home.sessionVariables.EDITOR = "nvim";

  # Binaries that neovim depends on goes here (mainly going to be lsp related).
  home.packages = with pkgs; [
    # lsp plugins
    vscode-langservers-extracted # eslint
    docker-compose-language-service # docker_compose-language_service
    dockerfile-language-server-nodejs # dockerls
    nodePackages.typescript-language-server # tsserver
    biome
    emmet-ls # emmet_ls
    lua-language-server # lua_ls
    nixd # nixd
    nil # nil_ls

    # formatting (none-ls plugins)
    stylua
    prettierd
    python310Packages.black
    python310Packages.isort

    # linting/diagnostics (none-ls plugins)
    # eslint_d
    alejandra
    deadnix

    # misc (non LSP plugs)
    typescript
    tree-sitter
    nixpkgs-fmt
  ];

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraLuaConfig = concatFiles [
      ./remap.lua
      ./settings.lua
    ];

    plugins = with pkgs.vimPlugins; [
      typescript-tools-nvim
      # Quality of life
      {
        plugin = nvim-autopairs;
        type = "lua";
        config = ''require("nvim-autopairs").setup()'';
      }
      {
        plugin = fromGitHub "mouseless-eth" "vim-huff" "main" "sha256-38aX8YZR/f4UzKf0CI0r7OZBcsLj5pbNJHfzdKJPVaw=";
      }
      {
        plugin = fidget-nvim;
        type = "lua";
        config = ''require("fidget").setup()'';
      }
      {
        plugin = tokyonight-nvim;
        type = "lua";
        config = readFile ./plugins/tokyonight.rc.lua;
      }
      {
        plugin = lspsaga-nvim;
        type = "lua";
        config = readFile ./plugins/lsp/saga.rc.lua;
      }

      # Misc
      {
        plugin = nvim-colorizer-lua;
        type = "lua";
        config = ''require("colorizer").setup()'';
      }

      # Git
      {
        plugin = vim-fugitive;
      }
      {
        plugin = gitsigns-nvim;
        type = "lua";
        config = readFile ./plugins/misc/gitsigns.rc.lua;
      }

      # Meta navigation
      {
        plugin = harpoon2;
        type = "lua";
        config = readFile ./plugins/navigation/harpoon.rc.lua;
      }
      #{ /* lets do this later ^^ */ plugin = leap-nvim; type = "lua"; config = readFile (./plugins/misc/leap.rc.lua); }

      # File browser
      {
        plugin = neo-tree-nvim;
        type = "lua";
        config = readFile ./plugins/tree/neo-tree.rc.lua;
      }
      # depends on:
      {
        plugin = nvim-web-devicons;
        type = "lua";
        config = readFile ./plugins/tree/web-devicons.rc.lua;
      }
      {plugin = plenary-nvim;}
      {plugin = nui-nvim;}

      # Statusline
      {
        plugin = lualine-nvim;
        type = "lua";
        config = readFile ./plugins/lualine.rc.lua;
      }

      # Terminal
      {
        plugin = toggleterm-nvim;
        type = "lua";
        config = readFile ./plugins/toggleterm.rc.lua;
      }

      # Telescope (fuzzy finder)
      {
        plugin = telescope-nvim;
        type = "lua";
        config = readFile ./plugins/telescope.rc.lua;
      }

      # Treesitter (highlighter)
      {plugin = nvim-treesitter.withAllGrammars;}

      # LSP Related
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = readFile ./plugins/lsp/lsp-config.rc.lua;
      }
      {
        plugin = none-ls-nvim;
        type = "lua";
        config = readFile ./plugins/lsp/none-ls.rc.lua;
      }

      # Rust specific
      #{
      #  plugin = rustaceanvim;
      #  type = "lua";
      #  config = readFile ./plugins/lsp/rustaceanvim.rc.lua;
      #}

      # Autocompletion
      {
        plugin = nvim-cmp;
        type = "lua";
        config = readFile ./plugins/lsp/cmp.rc.lua;
      }
      # Snippets
      {
        plugin = luasnip;
        type = "lua";
        config = readFile ./plugins/lsp/lspkind.rc.lua;
      }
      # strictly req:
      {plugin = cmp_luasnip;} # get sources from luasnip
      {plugin = friendly-snippets;} # strictly required
      {plugin = cmp-nvim-lsp;} # get sources from lsp
      {plugin = cmp-path;} # get sources from current dir
      {plugin = cmp-look;} # get sources from dictionary
      {plugin = cmp-buffer;} # get sources from dictionary
      {
        plugin = lspkind-nvim;
        type = "lua";
        config = readFile ./plugins/lsp/lspkind.rc.lua;
      }

      # Copilot
      {
        plugin = copilot-cmp;
        type = "lua";
        config = readFile ./plugins/copilot/copilot-cmp.rc.lua;
      }
      {
        plugin = copilot-lua;
        type = "lua";
        config = readFile ./plugins/copilot/copilot-lua.rc.lua;
      }
    ];
  };
}
