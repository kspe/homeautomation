class CreateControlItems < ActiveRecord::Migration
  def change
    create_table :control_items do |t|
      t.string :kind
      t.string :name
      t.string :value

      t.timestamps null: false
    end
  end
end
