class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :website
      t.string :image_file_name
      t.string :price
      t.boolean :fave
      t.boolean :archive

      t.timestamps null: false
    end
  end
end
