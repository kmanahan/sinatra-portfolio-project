class CreateAnimalsTable < ActiveRecord::Migration
  def change
    create_table :animals do |t| 
      t.string :name 
      t.string :species 
      t.integer :farmer_id
    end
  end
end
