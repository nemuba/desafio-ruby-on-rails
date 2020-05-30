class Store
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :website, type: String
  field :email, type: String
  mount_base64_uploader :logo, LogoUploader

  def to_s
    self.name
  end

  rails_admin do
    navigation_icon 'fa fa-star'
    object_label_method :to_s

    list do
      field :name
      field :website
      field :email
      field :logo, :carrierwave
      field :created_at
    end

    edit do
      field :name
      field :website
      field :email
      field :logo, :carrierwave
    end
  end
end
