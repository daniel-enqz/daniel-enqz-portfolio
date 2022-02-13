require_relative "../views/sessions_view"

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @sessions_view = SessionsView.new
  end

  def login
    username = @sessions_view.ask_for("username")
    password = @sessions_view.ask_for("password")
    employee = @employee_repository.find_by_username(username)
    if !employee.nil? && employee.password_match?(password)
      @sessions_view.greet(employee)
      return employee
    else
      @sessions_view.login_error
      return nil
    end
  end
end
