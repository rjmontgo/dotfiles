return {
  'vimwiki/vimwiki',
  init = function()
    vim.g.vimwiki_list = {{ path = "~/wiki" }, { path = "~/dev/storeup/wiki"}}
  end,
}
