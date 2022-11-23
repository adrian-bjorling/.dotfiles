local setup, comment = pcall(require, "bufferline")
if not setup then
    return
end

comment.setup()
