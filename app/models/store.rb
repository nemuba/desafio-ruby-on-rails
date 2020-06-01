class Store
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :website, type: String
  field :email, type: String
  mount_base64_uploader :logo, LogoUploader
  has_many :products, dependent: :destroy, :inverse_of => :store
  accepts_nested_attributes_for :products, :allow_destroy => true

  validates_presence_of :name, :website, :email

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
      field :products
    end

  end
end
