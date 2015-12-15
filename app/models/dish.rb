class Dish < ActiveRecord::Base
  belongs_to :restaurant

  validates :name, presence: true, uniqueness: true
end #Dish

# == Schema Information
#
# Table name: dishes
#
#  id            :integer          not null, primary key
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  restaurant_id :integer
#
# Indexes
#
#  index_dishes_on_restaurant_id  (restaurant_id)
#
