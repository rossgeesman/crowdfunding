class Ability
  include CanCan::Ability

  def initialize(customer)
    customer ||= Customer.new

    can :create, Customer
    can :show, Product
    can :show, Collaborator
    can :index, Collaborator

    if customer.email.present?

    can :manage, Customer, :id => customer.id
    can :create, Order, :customer_id => customer.id
    can :destroy, Order, :customer_id => customer.id
    can :read, Order, :customer_id => customer.id
    can :show, Product
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
end