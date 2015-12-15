class CreateOutings < ActiveRecord::Migration
  def change
    create_table :outings do |t|
      t.date :date
      t.text :note

      t.timestamps null: false
    end
  end
end
