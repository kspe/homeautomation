class DeviceType < ActiveRecord::Base
  has_many :control_items
  has_many :devices

  accepts_nested_attributes_for :control_items, reject_if: :all_blank, allow_destroy: true
end
