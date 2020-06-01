class User
  include Mongoid::Document

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  include Mongoid::Timestamps
  field :admin, type: Boolean

  validates_presence_of :email, :password, :password_confirmation

  def to_s
    self.email
  end


  rails_admin do
    navigation_icon 'fa fa-users'
    object_label_method :to_s
    visible do
      bindings[:controller]._current_user.admin?
    end

    list do
      field :email, :string
      field :created_at
    end

    edit do
      field :email, :string
      field :password, :string
      field :password_confirmation, :string
      field :admin do
        visible do
          bindings[:controller]._current_user.admin?
        end
      end
    end
  end
end
