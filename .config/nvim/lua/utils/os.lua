local M = {}

function GetOS()
    return vim.loop.os_uname().sysname
end

function M.get_home_dir()
    if GetOS() == "Windows_NT" then
        return os.getenv("USERPROFILE") .. "/.vim/undodir"
    else
        return os.getenv("HOME") .. "/.vim/undodir"
    end
end

return M
