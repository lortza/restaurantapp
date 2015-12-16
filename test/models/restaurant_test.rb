require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: restaurants
#
#  id              :integer          not null, primary key
#  name            :string
#  street          :string
#  city            :string
#  state           :string
#  zip             :string
#  phone           :string
#  website         :string
#  image_file_name :string
#  price           :string
#  fave            :boolean          default(FALSE)
#  archive         :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#  slug            :string
#
# Indexes
#
#  index_restaurants_on_user_id  (user_id)
#
