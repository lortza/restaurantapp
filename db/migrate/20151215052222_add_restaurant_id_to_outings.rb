class AddRestaurantIdToOutings < ActiveRecord::Migration
  def change
    add_reference :outings, :restaurant, index: true, foreign_key: true
  end
end
