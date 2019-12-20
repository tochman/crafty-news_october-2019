class Article < ApplicationRecord
  validates_presence_of :title, :content

  has_many :comments
  belongs_to :author, class_name: 'User'
end
