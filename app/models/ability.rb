class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, :all

    if user.role == 'admin' 
      can :manage, :all
    else
      can :manage, Post, author: user 
      can :manage, Comment, author: user
      can :read, :all
    end
  end
end