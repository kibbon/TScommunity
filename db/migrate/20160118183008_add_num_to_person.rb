class AddNumToPerson < ActiveRecord::Migration
  def change
	add_column :people, :num, :integer
  end
end
