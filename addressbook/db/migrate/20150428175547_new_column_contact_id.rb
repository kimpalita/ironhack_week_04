class NewColumnContactId < ActiveRecord::Migration
  def change
  	add_column :emails, :contact_id, :integer
  	add_column :telephones, :contact_id, :integer
  end
end
