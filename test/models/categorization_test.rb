require 'test_helper'

class CategorizationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: categorizations
#
#  id            :integer          not null, primary key
#  restaurant_id :integer
#  category_id   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_categorizations_on_category_id    (category_id)
#  index_categorizations_on_restaurant_id  (restaurant_id)
#
