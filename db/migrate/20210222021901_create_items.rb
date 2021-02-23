class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name,            null: false
      t.text :iteme_text,             null: false
      t.integer :item_category_id,    null: false
      t.integer :item_status_id,      null: false
      t.integer :item_price,          null: false
      t.integer :shipping_charges_id, null: false
      t.integer :shipping_area_id,    null: false
      t.integer :day_to_ship_id,      null: false
      t.references :user,              foreign_key: true
      t.timestamps
    end
  end
end
