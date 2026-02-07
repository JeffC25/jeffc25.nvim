return {
  {
    'nvim-tree/nvim-web-devicons',
    priority = 1000,
    config = function()
      require('nvim-web-devicons').set_icon({
        rs = { icon = '', color = '#dea584', name = 'Rust' },
      })
    end,
  },
}
