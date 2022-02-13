class EmployeesView
  def display(riders)
    riders.each_with_index do |rider, index|
      puts "#{index + 1} 🚴🏻#{rider.username}"
    end
  end
end
