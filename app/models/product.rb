class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :price, type: Integer
  field :plots, type: Integer
  # mount_base64_uploader :image, ImageUploader
  field :image, type: String
  field :url, type: String
  belongs_to :store

  rails_admin do
    navigation_icon 'fa fa-product-hunt'
    visible do
      bindings[:controller]._current_user.admin?
    end
    parent Store

    list do
      field :name, :string
      field :price, :integer
      field :plots, :integer
      field :image
    end

    show do
      field :name
      field :price
      field :plots
      field :image
    end
  end
end
