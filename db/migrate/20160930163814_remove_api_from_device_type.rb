class RemoveApiFromDeviceType < ActiveRecord::Migration
  def change
    remove_column :device_types, :api
  end
end
