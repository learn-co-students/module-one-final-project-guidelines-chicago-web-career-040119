class CreateWallets < ActiveRecord::Migration[5.0]
  def change
    create_table :wallets do |t|
      t.integer :user_id
      t.integer :coin_id
      t.float :quantity
  end
end
end
