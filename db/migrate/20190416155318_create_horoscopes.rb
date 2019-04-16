class CreateHoroscopes < ActiveRecord::Migration[5.2]
  def change
    create_table :horoscopes do |t|
      t.datetime :date_range
      t.datetime :current_date
      t.text :description
      t.string :compatibility
      t.string :mood
      t.string :color
      t.integer :lucky_number
      t.datetime :lucky_time
  end
end
