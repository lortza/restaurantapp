class Outing < ActiveRecord::Base
  belongs_to :restaurant
end #Outing

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
