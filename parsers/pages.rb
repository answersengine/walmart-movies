nokogiri = Nokogiri.HTML(content)

#load products
products = nokogiri.css('#searchProductResult li')
products.each do |product|
  href = product.at_css('a.product-title-link')['href']
  url = "https://www.walmart.com#{href}"
  pages << {
      url: url,
      page_type: 'products',
      vars: {}
    }
end

#load paginated links
pagination_links = nokogiri.css('ul.paginator-list li a')
pagination_links.each do |link|
  url = "https://www.walmart.com#{link['href']}"
  pages << {
      url: url,
      page_type: 'pages',
      vars: {}
    }
end
