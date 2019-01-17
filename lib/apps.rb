require 'rubygems'
require 'nokogiri'         
require 'open-uri'
   
symbol = []
price = []

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))      
page.xpath('//*[@class="text-left col-symbol"]').each do |f|
	symbol << f.text
end
page.xpath('//*[@class="price"]').each do |z|
	price << z.text
end
h = Hash[symbol.zip(price.map {|i| i.include?(',') ? (i.split /, /) : i})]
puts h