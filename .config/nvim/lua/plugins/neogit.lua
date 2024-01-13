local neogit_status, neogit = pcall(require, "neogit")
if not neogit_status then
    return
end

neogit.setup()
