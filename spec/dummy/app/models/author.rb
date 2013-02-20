class Author < ActiveRecord::Base
  attr_accessible :bio, :dob, :name

  has_many :books
end
