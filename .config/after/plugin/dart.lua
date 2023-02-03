-- Hot reload on save
--
function dartHotReload()
  vim.cmd[[silent execute '!kill -s USR1 "$(pgrep -f flutter_tools.snapshot\ run)" &> /dev/null']]
end

vim.cmd[[autocmd BufWritePost *.dart lua dartHotReload()]]
