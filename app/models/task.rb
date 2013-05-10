class Task < ActiveRecord::Base
  attr_accessible :description, :complete

  belongs_to :list

  validates :description, :presence => true
end
