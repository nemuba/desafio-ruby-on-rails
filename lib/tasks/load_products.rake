require 'rest-client'

namespace :load_products do
  desc "TODO - Load 100 products for each store"
  task load: :environment do
    begin
      # call API Fossill
      data = RestClient.get "https://www.fossil.com.br/api/catalog_system/pub/products/search?_from=0&_to=49"

      #Parse data of request
      response = JSON.parse(data.body)

      store = Store.find_by(name: "Fossil")

      # Mapping response for get product info
      products = response.map do |product|
        {
          :name => product['productName'],
          :price => product['items'][0]['sellers'][0]['commertialOffer']['Price'],
          :image => product['items'][0]['images'][0]['imageUrl'],
          :plots => 10,
          :url =>  product['link'],
          :store_id => store._id
        }
      end



      products.each do |product|
        # puts product[:image]
        if !Product.where(name: product[:name]).exists?
          Product.create(product)
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
