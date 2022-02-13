# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller     = meals_controller
    @customers_controller = customers_controller
    @sessions_controller  = sessions_controller
    @orders_controller    = orders_controller
    @current_user         = nil
    @running              = true
  end

  def run
    puts ""
    puts "Welcome to FoodDelivery!"
    puts "🍑🍿🥦🧇   --    🥓🌭🍔🍒"
    while @running
      @current_user = @sessions_controller.login until @current_user
      @current_user.manager? ? display_manager_tasks : display_rider_tasks
      action = gets.chomp.to_i
      print `clear`
      @current_user.manager? ? route_manager_action(action) : route_rider_action(action)
    end
  end

  private

  # MANAGER ACTIONS-----------------------------------
  def route_manager_action(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    # when 3 then @meals_controller.edit
    when 4 then @meals_controller.delete
    end
    route_manager_action_(action)
  end

  def route_manager_action_(action)
    case action
    when 5 then @customers_controller.add
    when 6 then @customers_controller.list
    # when 7 then @customers_controller.edit
    when 8 then @customers_controller.delete
    when 9 then @orders_controller.add
    when 10 then @orders_controller.list_undelivered_orders
    when 0 then stop
    else
      puts "Please press 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 or 0"
    end
  end

  # RIDER ACTIONS-----------------------------------
  def route_rider_action(action)
    case action
    when 1 then @orders_controller.mark_as_delivered(@current_user)
    when 2 then @orders_controller.list_my_orders(@current_user)
    when 0 then stop
    else
      puts "Please press 1, 2 or 0"
    end
  end

  # GENERAL EXIT PROGRAM METHOD-----------------------------------
  def stop
    @running = false
  end

  # MANAGER TASKS DISPLAYED-----------------------------------
  def display_manager_tasks
    puts "What do you want to do next?"
    puts "1 - 🧃Add new meal"
    puts "2 - 🍽List all meals"
    puts "3 - 🥢Edit a meal(COMMING SOON)"
    puts "4 - 🥊Delete a meal"
    display_manager_tasks_
  end

  def display_manager_tasks_
    puts "5 - 🐢Add new customer"
    puts "6 - 🌊List all customers"
    puts "7 - 🐎Edit a customer(COMMING SOON)"
    puts "8 - 🥊Delete a customer"
    puts "9 - 🥝Add a new order"
    puts "10- ❌List all the undelivered orders"
    puts "0 - 🌴EXIT"
  end

  # RIDER TASKS DISPLAYED-----------------------------------
  def display_rider_tasks
    puts "What do you want to do next?"
    puts "1 - ✅Mark one of my orders as delivered"
    puts "2 - 🥕List all my undelivered orders"
    puts "0 - 🌴EXIT"
  end
end
