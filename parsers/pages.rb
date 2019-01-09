nokogiri = Nokogiri.HTML(content)

pagination_links = nokogiri.at_css('ul.paginator-list li a')
pagination_links.each do |link|
  raise link['href'].inspect
end
pages << {
    url: product['url'],
    page_type: 'listings',
    vars: {}
  }
