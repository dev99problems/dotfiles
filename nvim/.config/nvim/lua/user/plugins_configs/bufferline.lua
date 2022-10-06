local status_ok, bufferline = pcall(require, 'bufferline')

if not status_ok then
  print 'bufferline was not loaded properly!'
  return
end

bufferline.setup {
  options = {
    numbers = 'ordinal'
  }
}
