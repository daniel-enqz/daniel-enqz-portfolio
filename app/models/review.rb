# == Schema Information
#
# Table name: reviews
#
#  id         :bigint           not null, primary key
#  email      :text
#  first_name :string
#  last_name  :string
#  message    :text
#  rating     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
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
