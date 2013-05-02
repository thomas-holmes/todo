class List < ActiveRecord::Base
  attr_accessible :title

  belongs_to :user

  has_many :tasks

  validates :title, :presence => true
end
