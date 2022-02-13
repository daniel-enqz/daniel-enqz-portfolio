require_relative '../repositories/customer_repository'
require 'pry-byebug'
require_relative 'base_view'

class CustomersView < BaseView
  def display(all_customers)
    all_customers.each_with_index do |customer, index|
      puts "- #{index + 1}🙋 #{customer.name} 🏠ADDRESS:#{customer.address}"
    end
  end
end
