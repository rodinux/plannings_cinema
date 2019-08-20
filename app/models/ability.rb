class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

      if user.role == "manager"
       can :access, :rails_admin
       can :read, :dashboard
       can :update, User
       can :update, Seance
       cannot :update, Village
       cannot :destroy, User
       cannot :destroy, Seance
       cannot :import, :all

    end
    # alias_action :update, :destroy, :create, :to => :write
    if user.role == "admin"
      can :access, :rails_admin
      can :read, :dashboard
      can :manage, :all
      #can :edit, :all
      can :update, :all
      can :destroy, :all
      can :import, :all
    end
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end