class Review < ApplicationRecord
  RATING = ["",
    ["⭐️", 1],
    ["⭐️⭐️", 2],
    ["⭐️⭐️⭐️", 3],
    ["⭐️⭐️⭐️⭐️", 4],
    ["⭐️⭐️⭐️⭐️⭐️", 5]].freeze

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :message, presence: true
  validates :message, length: {minimum: 25, maximum: 500}
  validates :rating, presence: true, inclusion: {in: 1..5}
end
