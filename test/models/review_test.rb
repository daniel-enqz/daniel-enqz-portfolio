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
require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
