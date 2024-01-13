-- 基础设置
require('basic')
-- 快捷键映射
require('keybindings')
-- Packer 插件管理
require("plugins")
-- 主题设置 （新增）
require("colorscheme")
-- tree目录
require("plugin-config.nvim-tree")
-- tab栏目
require("plugin-config.bufferline")
-- 下方状态栏
require("plugin-config.lualine")
-- 模糊搜索插件
require("plugin-config.telescope")
-- 代码高亮(语法级高亮)插件 
require("plugin-config.nvim-treesitter")
-- LSP配置（代码补全等配置） 
require("lsp.setup")
-- cmp（代码补全）
require("cmp.setup")
