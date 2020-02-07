class CreateFarmersTable < ActiveRecord::Migration
  def change
    create_table :farmers do |t| 
      t.string :name 
      t.string :farm_name
    end
  end
end
