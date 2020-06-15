class CreateCryptocurrencies < ActiveRecord::Migration[5.0]
  def change
    create_table :cryptocurrencies do |t|
      t.string :ticker
      t.string :name
      t.float :usd
      t.float :percent_change_24hr
      t.float :market_cap
  end
end
end
