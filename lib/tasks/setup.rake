require 'rest-client'
require 'json'
require 'down'

namespace :setup do
  desc "TODO - create user admin"
  task create_admin: :environment do
    admin = User.new(email: "admin@admin.com", password: "123456789", password_confirmation: "123456789", admin: true)

    unless User.where(email: admin.email).exists?
      admin.save
      puts "Created Admin user  with success!"
    else
      puts "Admin user already exists!"
    end
  end

  desc "TODO - create stores"
  task create_stores: :environment do
    fossil =  Store.new(name: "Fossil", email: "fossil@gmail.com", website: "site@fossil.com", logo: nil)
    timex  =  Store.new(name: "Timex", email: "timex@gmail.com", website: "site@timex.com", logo: nil)
    schumman = Store.new(name: "Schumman", email: "schumman@gmail.com", website: "site@schumman.com", logo: nil)

    unless Store.where(name: fossil.name).exists?
      if fossil.save
        puts "Store #{fossil.name} creted with success !"
      end
    end

    unless Store.where(name: timex.name).exists?
      if timex.save
        puts "Store #{timex.name} creted with success !"
      end
    end

    unless Store.where(name: schumman.name).exists?
      if schumman.save
        puts "Store #{schumman.name} creted with success !"
      end
    end

    puts "Process completed!"
  end

  desc "TODO - Load products"
  task load_products: :environment do
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
        unless Product.where(name: product[:name]).exists?
          Product.create(product)
        end
      end

      puts "Load Complete !"

      rescue RestClient::Unauthorized, RestClient::Forbidden => err
        puts 'Access denied'
        return err.response
      rescue RestClient::ImATeapot => err
        puts 'The server is a teapot! # RFC 2324'
        return err.response
      rescue RestClient::NotFound => err
        puts 'Page Not Found'
        return err.response
      rescue RestClient::ResourceNotFound => e
        puts "Erro: #{e.response}"
        return e.response
      rescue SocketError => e
        puts "Erro: #{e.class}"
        return e
      rescue Errno::ECONNREFUSED => e
        puts "Erro: #{e.class}"
        return e
      end

  end

end
