class ControlItem < ActiveRecord::Base
  belongs_to :device_type

  def slider?
    kind == 'slider'
  end

  def select_options
    value.split(',')
  end
end
