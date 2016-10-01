class AddApiEndpointToControlItem < ActiveRecord::Migration
  def change
    add_column :control_items, :api_endpoint, :string
  end
end
