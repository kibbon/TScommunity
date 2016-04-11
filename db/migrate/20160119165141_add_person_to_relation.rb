class AddPersonToRelation < ActiveRecord::Migration
  def change
	add_reference :relations, :person
  end
end
