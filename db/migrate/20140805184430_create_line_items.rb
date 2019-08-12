class CreateLineItems < ActiveRecord::Migration[4.2]
  def change
    create_table :line_items do |t|
    t.integer :cart_id
    t.integer :item_id
    t.integer :quantity, default: 1
    end
  end
end
