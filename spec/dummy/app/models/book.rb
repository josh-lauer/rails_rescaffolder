class Book < ActiveRecord::Base
  attr_accessible :author_id, :description, :in_stock, :isbn, :publish_date, :title

  belongs_to :author
  has_many :book_categories
  has_many :categories, :through => :book_categories
end
