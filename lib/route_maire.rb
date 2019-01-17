require 'rubygems'
require 'nokogiri'         
require 'open-uri'

def get_townhall_urls
all_url = []
page3 = Nokogiri::HTML(open("https://annuaire-des-mairies.com/val-d-oise.html"))      
	page3.xpath('//a[@class="lientxt"]').each do |f|
	all_url << f['href']
	end	
	return all_url
end

	get_townhall_urls.each do |lits|
	mail_list = []
page2 = Nokogiri::HTML(open("https://annuaire-des-mairies.com/#{lits}"))
	page2.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |r|
	mail_list << r.text
	end
	mail_list
end

def val_doise(get_townhall_urls)
	hh = get_townhall_urls
	val = []
	page = Nokogiri::HTML(open("https://annuaire-des-mairies.com/val-d-oise.html"))      
	page.xpath('//a[@class="lientxt"]').each do |h|
	val << h.text
	end	
 return val
 h = Hash[val.zip(hh.map {|i| i.include?(',') ? (i.split /, /) : i})]
 puts h
end
val_doise(get_townhall_urls)