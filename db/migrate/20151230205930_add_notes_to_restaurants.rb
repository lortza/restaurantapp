class AddNotesToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :notes, :string
  end
end
