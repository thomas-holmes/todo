class Task < ActiveRecord::Base
  attr_accessible :description, :importance
  belongs_to :user

  validates :description, :presence => true
  validates :importance, :presence => true
end
