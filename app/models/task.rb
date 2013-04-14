class Task < ActiveRecord::Base
  attr_accessible :description, :importance

  validates :description, :presence => true
  validates :importance, :presence => true
end
