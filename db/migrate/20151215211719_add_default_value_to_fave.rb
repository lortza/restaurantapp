class AddDefaultValueToFave < ActiveRecord::Migration
  def up
    change_column :restaurants, :fave, :boolean, :default => false
  end #up

  def down
    change_column :restaurants, :fave, :boolean, :default => nil
  end #down
end #migration
