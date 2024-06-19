local function _map(mode, noremap)
    return function(lhs, rhs, opts)
        opts = opts or {}
        opts.noremap = noremap
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

noremap = _map("", true)
nnoremap = _map("n", true)
vnoremap = _map("v", true)
snoremap = _map("s", true)
xnoremap = _map("x", true)
onoremap = _map("o", true)
inoremap = _map("i", true)
lnoremap = _map("l", true)
cnoremap = _map("c", true)
tnoremap = _map("t", true)

map = _map("", false)
nmap = _map("n", false)
vmap = _map("v", false)
smap = _map("s", false)
xmap = _map("x", false)
omap = _map("o", false)
imap = _map("i", false)
lmap = _map("l", false)
cmap = _map("c", false)
tmap = _map("t", false)
