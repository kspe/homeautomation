class AddDeviceTypeToControlItem < ActiveRecord::Migration
  def change
    add_reference :control_items, :device_type, index: true, foreign_key: true
  end
end
