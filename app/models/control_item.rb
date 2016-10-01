class ControlItem < ActiveRecord::Base
  KINDS = %w(select slider button)

  belongs_to :device_type

  def slider?
    kind == 'slider'
  end

  def select_options
    value.split(',')
  end

  def api_verb
    api_endpoint.to_s.strip.split.first
  end

  def api_url
    api_endpoint.to_s.strip.split.last
  end
end
