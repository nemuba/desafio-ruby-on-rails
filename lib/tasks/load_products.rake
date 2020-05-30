require 'rest-client'

namespace :load_products do
  desc "TODO - Load 100 products for each store"
  task load: :environment do
    begin
      # call API Fossill
      data = RestClient.get "https://www.fossil.com.br/api/catalog_system/pub/products/search?_from=0&_to=2"

      #Parse data of request
      response = JSON.parse(data.body)

      # Mapping response for get product info
      products = response.map do |product|
        {
          :name => product['productName'],
          :price => product['items'][0]['sellers'][0]['commertialOffer']['Price'],
          :image => product['items'][0]['images'][0]['imageUrl'],
          :url =>  product['link']
        }
      end

      products.each do |p|
        if !Product.where(name: p[:name]).exists?
          Product.create(p)
        end
      end


    rescue RestClient::NotFound => e
      puts "API Fossil Page Not Found: #{e}"
      return e
    rescue RestClient::BadRequest => b
      puts "API Fossil Bad Request: #{b}"
      return b
    else
      puts 'Load Complete !'
    end

  end

end
