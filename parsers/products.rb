nokogiri = Nokogiri.HTML(content)

title = nokogiri.at_css('.ProductTitle').text.strip
price = nokogiri.att_css('span.price-characteristic').attr('content')
raise content.inspect
=begin
  product = {}
  # extract the information into the product hash
  product['title'] = listing.at_css('h3.s-item__title')&.text

  # extract the price
  product['price'] = listing.at_css('.s-item__price')&.text

  # extract the listing URL
  item_link = listing.at_css('a.s-item__link')
  product['url'] = item_link['href'] unless item_link.nil?

  # specify the collection where this record will be stored
  product['_collection'] = "listings"

  # save the product to the job’s outputs
  outputs << product
=end
