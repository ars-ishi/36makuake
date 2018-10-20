class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :access, :rails_admin
      can :manage, :all
    elsif user.promoter?
      can :promoter, :all
      cannot :access, :rails_admin
    elsif user.supporter?
      can :supporter, :all
      cannot :access, :rails_admin
    end
  end
end
