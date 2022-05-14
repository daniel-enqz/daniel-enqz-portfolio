class OrdersView
  def ask_for_index
    puts "What number?"
    print ">"
    gets.chomp.to_i - 1
  end

  def display(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1} 🍔MEAL TO DELIVER: #{order.meal.name} 🙋CUSTOMER NAME: #{order.customer.name}
      🏠CUSTOMER ADDRESS: #{order.customer.address}"
    end
  end

  def display_undelivered_orders(all)
    all.each_with_index do |order, _index|
      puts "🍔MEAL: #{order.meal.name}, 🚴🏻RIDER: #{order.employee.username.capitalize}, 🙋: #{order.customer.name}"
    end
  end
end
