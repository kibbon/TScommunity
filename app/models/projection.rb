class Projection < ActiveRecord::Base
	has_many :discussions
	has_many :relations
end
