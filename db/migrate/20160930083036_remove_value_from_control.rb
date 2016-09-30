class RemoveValueFromControl < ActiveRecord::Migration
  def change
    remove_column :controls, :value
  end
end
