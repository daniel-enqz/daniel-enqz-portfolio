class Order
  attr_reader :meal, :customer, :employee, :delivered
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @meal = attributes[:meal]
    @customer = attributes[:customer]
    @employee = attributes[:employee]
    @delivered = attributes[:delivered] || false
  end

  def deliver!
    @delivered = true
  end

  def delivered?
    @delivered
  end
end
