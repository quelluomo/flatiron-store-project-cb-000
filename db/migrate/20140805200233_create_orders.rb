class CreateOrders < ActiveRecord::Migration[4.2]
  def change
    create_table :orders do |t|
    t.integer :user_id
    end
  end
end
