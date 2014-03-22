def have_image(path)
  have_xpath("//img[@src=\"/assets/#{path}\"]")
end