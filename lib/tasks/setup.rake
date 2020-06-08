require 'rest-client'
require 'json'
require 'down'

namespace :setup do
  desc "TODO - create user admin"
  task create_admin: :environment do

    spinner = TTY::Spinner.new("[:spinner] Creating user admin ...", format: :pulse_2)

    spinner.auto_spin # Automatic animation with default interval

    admin = User.new(email: "admin@admin.com", password: "123456789", password_confirmation: "123456789", admin: true)

    unless User.where(email: admin.email).exists?
      admin.save
      spinner.success "Created Admin user  with success!"
    else
      spinner.success "Admin user already exists!"
    end

    spinner.stop('Done!') # Stop animation

  end

  desc "TODO - create stores"
  task create_stores: :environment do


    spinner = TTY::Spinner.new("[:spinner] Creating stores ...", format: :pulse_2)

    spinner.auto_spin # Automatic animation with default interval

    fossil =  Store.new(name: "Fossil", email: "fossil@gmail.com", website: "site@fossil.com", logo: nil)
    timex  =  Store.new(name: "Timex", email: "timex@gmail.com", website: "site@timex.com", logo: nil)
    schumman = Store.new(name: "Schumman", email: "schumman@gmail.com", website: "site@schumman.com", logo: nil)

    unless Store.where(name: fossil.name).exists?
      if fossil.save
        spinner.success "Store #{fossil.name} creted with success !"
      end
    end

    unless Store.where(name: timex.name).exists?
      if timex.save
        spinner.success "Store #{timex.name} creted with success !"
      end
    end

    unless Store.where(name: schumman.name).exists?
      if schumman.save
        spinner.success "Store #{schumman.name} creted with success !"
      end
    end

    spinner.success "Process completed!"

    spinner.stop('Done !')
  end

  desc "TODO - Load products"
  task load_products: :environment do
    apis = [
      'https://www.fossil.com.br/api/catalog_system/pub/products/search?_from=0&_to=49',
      'http://www.timex.com.br/api/catalog_system/pub/products/search/',
      'https://www.schumann.com.br/api/catalog_system/pub/products/search/'
    ]

    stores = [
      'Fossil','Timex','Schumman'
    ]

  spinners = TTY::Spinner::Multi.new("[:spinner] Loading ...")

  apis.each.with_index do |api,index|

    begin
      spinner = spinners.register "[:spinner] Loading #{stores[index]}"

      spinner.auto_spin # Automatic animation with default interval
      # call API Fossill
      data = RestClient.get(api)

      #Parse data of request
      response = JSON.parse(data.body)

      store = Store.find_by(name: stores[index])

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
          temp = Down.download(product[:image])

          File.open(temp.path) do |f|
            p = Product.new
            p.name = product[:name]
            p.price = product[:price].to_i
            p.plots = product[:plots].to_i
            p.store_id = product[:store_id]
            p.image = f
            p.save!
          end

          File.delete(temp.path)
        end
      end

      spinner.success "Load Complete !"
      spinner.stop('Done !')

      rescue RestClient::Unauthorized, RestClient::Forbidden => err
        spinner.error 'Access denied'
        spinner.stop('Done !')
      rescue RestClient::ImATeapot => err
        spinner.error 'The server is a teapot! # RFC 2324'
        spinner.stop('Done !')
      rescue RestClient::NotFound => err
        spinner.error 'Page Not Found'
        spinner.stop('Done !')
      rescue RestClient::ResourceNotFound => e
        spinner.error "Erro: #{e.response}"
        spinner.stop('Done !')
      rescue SocketError => e
        spinner.error "Erro: #{e.class}"
        spinner.stop('Done !')
      rescue Errno::ECONNREFUSED => e
        spinner.error "Erro: #{e.class}"
        spinner.stop('Done !')
      rescue RestClient::ExceptionWithResponse => e
        spinner.error "Erro Exception: #{e.http_code}"
        spinner.stop('Done !')
      end
  end

  end



end
