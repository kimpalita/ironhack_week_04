class CreateTelephones < ActiveRecord::Migration
  def change
    create_table :telephones do |t|
      t.integer :phone_number
      t.timestamps null: false
    end
  end
end
