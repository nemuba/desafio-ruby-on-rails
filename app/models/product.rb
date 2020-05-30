class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :price, type: Integer
  field :plots, type: Integer
  mount_base64_uploader :image, ImageUploader
  field :url, type: String
  belongs_to :store

  rails_admin do
    navigation_icon 'fa fa-product-hunt'
    parent Store

    list do
      field :name
      field :price
      field :plots
      field :image, :carrierwave
    end

    show do
      field :name
      field :price
      field :plots
      field :image, :carrierwave
    end
  end
end
