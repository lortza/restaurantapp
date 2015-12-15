class AddDefaultValueToArchive < ActiveRecord::Migration
  def up
    change_column :restaurants, :archive, :boolean, :default => false
  end #up

  def down
    change_column :restaurants, :archive, :boolean, :default => nil
  end #down
end
