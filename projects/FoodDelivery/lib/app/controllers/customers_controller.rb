require_relative "../views/customers_view"
require_relative "../models/customer"
require_relative "base_controller"

class CustomersController < BaseController
  def initialize(repository)
    @repository = repository
    @view       = CustomersView.new
  end

  def add
    name = @view.ask_for("customer name?")
    address = @view.ask_for("customer address?")
    new_customer = Customer.new(name: name, address: address)
    @repository.create(new_customer)
    list
  end
end
