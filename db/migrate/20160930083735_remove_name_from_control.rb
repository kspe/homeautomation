class RemoveNameFromControl < ActiveRecord::Migration
  def change
    remove_column :controls, :name
  end
end
