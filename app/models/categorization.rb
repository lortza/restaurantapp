class Categorization < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :category
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
# Foreign Keys
#
#  fk_rails_0555c6a3b5  (restaurant_id => restaurants.id)
#  fk_rails_5a40b79a1d  (category_id => categories.id)
#
