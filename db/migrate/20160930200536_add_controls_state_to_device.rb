class AddControlsStateToDevice < ActiveRecord::Migration
  def change
    add_column :devices, :controls_state, :text
  end
end
