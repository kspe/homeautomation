class ControlItem < ActiveRecord::Base
  belongs_to :device_type

  def slider?
    kind == 'slider'
  end
end
