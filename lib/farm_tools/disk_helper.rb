module DiskHelper
  #untested
  def DiskHelper.file_names(path, suffix_to_remove = '')
    Dir.glob(path).each.collect{ |f| File.basename(f, suffix_to_remove) }
  end
end