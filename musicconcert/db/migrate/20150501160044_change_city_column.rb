class ChangeCityColumn < ActiveRecord::Migration
  def change
  	remove_column :concerts, :city
  	add_column :concerts, :city_id, :integer
  end
end
