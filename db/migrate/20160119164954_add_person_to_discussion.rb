class AddPersonToDiscussion < ActiveRecord::Migration
  def change
	add_reference :discussions, :person
  end
end
