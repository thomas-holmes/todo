class Task < ActiveRecord::Base
  attr_accessible :description

  belongs_to :list

  validates :description, :presence => true
end
