class Outing < ActiveRecord::Base
  belongs_to :restaurant
end #Outing

# == Schema Information
#
# Table name: outings
#
#  id         :integer          not null, primary key
#  date       :date
#  note       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
