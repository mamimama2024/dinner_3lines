class Recipe < ApplicationRecord
  require 'nokogiri'
  require 'open-uri'
  
    def self.fetch_ogp_info(url)
      html = URI.open(url)
      doc = Nokogiri::HTML(html)
      
      title = doc.css('meta[property="og:title"]').first['content']
      description = doc.css('meta[property="og:description"]').first['content']
      image_url = doc.css('meta[property="og:image"]').first['content']
  
      { title: title, description: description, image_url: image_url }
    end
  
  belongs_to :user
end
