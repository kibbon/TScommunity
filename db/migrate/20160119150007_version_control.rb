class VersionControl < ActiveRecord::Migration
  def change
	load "#{Rails.root}/db/seeds.rb"
  end
end
