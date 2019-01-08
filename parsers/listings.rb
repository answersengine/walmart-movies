nokogiri = Nokogiri.HTML(content)
listings = nokogiri.css('#searchProductResult li')

count = 0
listings.each do |listing|
  # initialize an empty hash
  movie = {}
  count += 1
  puts count

  puts listing.at_css('a.product-title-link').text.strip
end
