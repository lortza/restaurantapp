require 'test_helper'

class OutingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: outings
#
#  id            :integer          not null, primary key
#  date          :date
#  note          :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  restaurant_id :integer
#
# Indexes
#
#  index_outings_on_restaurant_id  (restaurant_id)
#
