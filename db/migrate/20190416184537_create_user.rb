class CreateUser < ActiveRecord::Migration[5.2]
   def change
     create_table :users do |t|
       t.string :name.uniq
       t.datetime :birthday
       t.string :sign
    end
  end
end
