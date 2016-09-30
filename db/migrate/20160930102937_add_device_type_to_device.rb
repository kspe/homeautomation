class AddDeviceTypeToDevice < ActiveRecord::Migration
  def change
    add_reference :devices, :device_type, index: true, foreign_key: true
  end
end
