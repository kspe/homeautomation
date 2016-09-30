class Device < ActiveRecord::Base
  belongs_to :device_type

  serialize :controls_state, Hash

  def control_items?
   device_type.control_items.any?
  end

  def control_value_for(control_item)
    controls_state[control_item.name.parameterize]
  end
end
