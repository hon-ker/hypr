local packer = require("packer")
packer.startup({
  function(use)
    -- Packer 可以管理自己本身
    use 'wbthomason/packer.nvim'
    -- tokyonight
    use("folke/tokyonight.nvim")
    -- nvim-tree (新增)
    use({ "nvim-tree/nvim-tree.lua", requires = "nvim-tree/nvim-web-devicons" })
    -- bufferline (新增)
    use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
    -- lualine (新增)
    use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
    use("arkav/lualine-lsp-progress")

    -- 
    --记住状态
    use( {"cbochs/grapple.nvim",requires = { "nvim-lua/plenary.nvim"}})

    -- telescope （新增）
    use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
    -- telescope extensions
    use "LinArcX/telescope-env.nvim"

    -- treesitter 代码高亮
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

    -- 记住上回打开的状态
    use({"folke/persistence.nvim"})

    -- lsp server管理器
    use({ "williamboman/mason.nvim", run = ":MasonUpdate" })
    use({ "williamboman/mason-lspconfig.nvim"})

    -- neovim lsp cilent 配置
    use({ "neovim/nvim-lspconfig"})

    -- 补全插件
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    -- For vsnip users.
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    -- use("rafamadriz/friendly-snippets")
    
    -- MARKDOWN预览
    --use("iamcco/markdown-preview.nvim")
    --use("dhruvasagar/vim-table-mode")
    --use("ferrine/md-img-paste.vim")
    
    -- 个人用增强nvim功能
    -- 1. 替换查找
    use("mileszs/ack.vim")
    -- UI 增强
    use { 'yaocccc/vim-comment', cmd = '*ToggleComment' }                          -- 注释插件
    use { 'yaocccc/vim-fcitx2en',
      setup = function()
        vim.g.fcitx_on_events = 'InsertLeave,InsertEnter'
      end,
      event = 'InsertLeavePre' }                                                       -- 退出输入模式时自动切换到英文
    use { 'yaocccc/nvim-hlchunk', event = { 'CursorMoved', 'CursorMovedI' } }      -- 高亮{}范围



  end,
  config = {
    -- 并发数限制
    max_jobs = 16,
    -- 自定义源
    git = {
      --default_url_format = "https://gitclone.com/github.com/%s",
    },
  },
})

-- 每次保存 plugins.lua 自动安装插件
pcall(
  vim.cmd,
  [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]
)
