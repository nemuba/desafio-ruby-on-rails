class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :price, type: Integer
  field :plots, type: Integer
  field :url, type: String
  #  mount upload carrierwave base64
  mount_base64_uploader :image, ImageUploader

  # relations
  belongs_to :store, :inverse_of => :products

  # validates
  validates_presence_of :name, :price, :plots

  searchkick

  def search_data
    {name: name}
  end

  # callback update url
  after_create :update_url

  def update_url
    self.url = "/product/#{self._id}"
    self.save
  end


  rails_admin do
    navigation_icon 'fa fa-product-hunt'
    visible do
      bindings[:controller]._current_user.admin?
    end
    parent Store

    list do
      field :name, :string
      field :price do
        formatted_value do
          "R$ #{value}"
        end
      end
      field :plots do
        formatted_value do
          "#{value} X"
        end
      end
      field :image, :carrierwave
      field :store
    end

    show do
      field :name, :string
      field :price, :integer
      field :plots, :integer
      field :image, :carrierwave
      field :store
    end

    create do
      field :name
      field :price
      field :plots
      field :image, :carrierwave
      field :store
    end

    edit do
      field :name, :string
      field :price, :integer
      field :plots, :integer
      field :image, :carrierwave
      field :store
    end

  end
end
