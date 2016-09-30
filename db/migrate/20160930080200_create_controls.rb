class CreateControls < ActiveRecord::Migration
  def change
    create_table :controls do |t|
      t.string :kind
      t.string :name
      t.string :value

      t.timestamps null: false
    end
  end
end
