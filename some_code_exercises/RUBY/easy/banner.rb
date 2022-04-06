class Human < ApplicationRecord
  has_one :pc
  has_many :dreams

  vaidates :keyboard, presence: true
  @name = 'Daniel'

  def say_hello?
    current_user.pana?
  end
end
