class Category < ActiveRecord::Base
  attr_accessible :active, :description, :name

  has_many :book_categories
  has_many :books, :through => :book_categories
end
