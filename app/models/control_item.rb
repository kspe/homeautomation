class ControlItem < ActiveRecord::Base
  KINDS = %w(select slider button)

  belongs_to :device_type

  def slider?
    kind == 'slider'
  end

  def select_options
    value.split(',')
  end
end
