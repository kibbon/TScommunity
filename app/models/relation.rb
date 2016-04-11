class Relation < ActiveRecord::Base
  belongs_to :projection
  belongs_to :person
end
