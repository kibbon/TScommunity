class CreateProjections < ActiveRecord::Migration
  def change
    create_table :projections do |t|
      t.string :title
      t.text :info
      t.integer :user_num

      t.timestamps null: false
    end
  end
end
