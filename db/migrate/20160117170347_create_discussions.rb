class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.text :content
      t.references :projection, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
