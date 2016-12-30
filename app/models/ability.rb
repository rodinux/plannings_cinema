class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

      if user.role == "manager"
       can :read, Village
       can :update, User
       can :update, Seance
       cannot :update, Village
       cannot :destroy, User
       cannot :destroy, Seance
       cannot :rails_admin
       cannot :import, :all

    end
    # alias_action :update, :destroy, :create, :to => :write
    if user.role == "admin"
      can :manage, :all
      # can :write, :all
      can :update, :all
      can :destroy, :all
      can :rails_admin
      can :dashboard
      can :import, :all
    end
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
