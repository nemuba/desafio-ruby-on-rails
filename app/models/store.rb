class Store
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :website, type: String
  field :email, type: String
  mount_base64_uploader :logo, LogoUploader
  has_many :products, dependent: :destroy
  accepts_nested_attributes_for :products, :allow_destroy => true

  def to_s
    self.name
  end

  rails_admin do
    navigation_icon 'fa fa-star'
    object_label_method :to_s

    visible do
      bindings[:controller]._current_user.admin?
    end

    list do
      field :name, :string
      field :website, :string
      field :email, :string
      field :logo, :carrierwave
      field :created_at
    end

    edit do
      field :name, :string
      field :website, :string
      field :email, :string
      field :logo, :carrierwave
    end

    create do
      configure :products do

      end
    end
  end
end
