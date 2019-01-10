nokogiri = Nokogiri.HTML(content)

# initialize an empty hash
product = {}

#extract title
product['title'] = nokogiri.at_css('.ProductTitle').text.strip

#extract current price
product['current_price'] = nokogiri.at_css('span.price-characteristic').attr('content')

#extract original price
original_price_div = nokogiri.at_css('.price-old')
product['original_price'] = original_price_div ? original_price_div.text.strip.gsub('$','') : nil

#extract rating
product['rating'] = nokogiri.at_css('.hiddenStarLabel .seo-avg-rating').text.strip

#extract number of reviews
review_text = nokogiri.at_css('.stars-reviews-count-node').text.strip
product['reviews_count'] = review_text =~ /reviews/ ? review_text.split(' ').last : 0

#extract publisher
product['publisher'] = nokogiri.at_css('a.prod-brandName').text.strip

#extract walmart item number
product['walmart_number'] = nokogiri.at_css('.prod-productsecondaryinformation .wm-item-number').text.split('#').last.strip

#extract product image
product['img_url'] = nokogiri.at_css('.prod-hero-image img')['src'].split('?').first

#extract product categories
product['categories'] = nokogiri.css('.breadcrumb-list li').collect{|li| li.text.strip.gsub('/','') }.join(' > ')

# specify the collection where this record will be stored
product['_collection'] = "products"

# save the product to the job’s outputs
outputs << product
