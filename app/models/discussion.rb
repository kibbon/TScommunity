class Discussion < ActiveRecord::Base
  belongs_to :projection
  belongs_to :person
  validates :content, presence: true
end
