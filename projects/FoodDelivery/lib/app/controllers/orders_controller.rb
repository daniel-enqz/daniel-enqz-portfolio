require_relative "../views/orders_view"
require_relative "../views/meals_view"
require_relative "../views/employees_view"
require_relative "../views/customers_view"
require_relative "../models/order"
require_relative '../repositories/base_repository'
require 'pry-byebug'

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository     = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository    = order_repository
    @orders_view         = OrdersView.new
    @meals_view          = MealsView.new
    @customers_view      = CustomersView.new
    @employees_view      = EmployeesView.new
  end

  # MANAGER ACTIONS
  def call_meal
    meals = @meal_repository.all
    @meals_view.display(meals)
    meals[@orders_view.ask_for_index]
  end

  def call_customer
    customer = @customer_repository.all
    @customers_view.display(customer)
    customer[@orders_view.ask_for_index]
  end

  def call_employee
    riders = @employee_repository.all_riders
    @employees_view.display(riders)
    riders[@orders_view.ask_for_index]
  end

  def add
    meal = call_meal
    customer = call_customer
    rider = call_employee
    new_order = Order.new(meal: meal, customer: customer, employee: rider)
    @order_repository.create(new_order)
  end

  def list_undelivered_orders
    all = @order_repository.undelivered_orders
    @orders_view.display_undelivered_orders(all)
  end

  # RIDER ACTIONS
  def list_my_orders(current_user)
    orders = @order_repository.undelivered_from(current_user)
    @orders_view.display(orders)
  end

  def mark_as_delivered(current_user)
    orders = @order_repository.undelivered_from(current_user)
    @orders_view.display(orders)
    index = @orders_view.ask_for_index
    order = orders[index]
    @order_repository.mark_as_delivered(order.id)
  end
end
