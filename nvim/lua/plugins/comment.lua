local Comment_status, Comment = pcall(require, "Comment")
if not Comment_status then
    return
end

Comment.setup()
