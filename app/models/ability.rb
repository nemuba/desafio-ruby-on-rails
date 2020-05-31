class Ability
  include CanCan::Ability
  def initialize(user)
    if user.admin?
      can :access, :rails_admin
      can :manage, :all                 # allow everyone to read everything
    else
      can :access, :rails_admin       # only allow admin users to access Rails Admin
      can :read, :dashboard           # allow access to dashboard
      can [:show], User
      can :manage, User, id: user.id
      cannot :index, User
    end
  end
end