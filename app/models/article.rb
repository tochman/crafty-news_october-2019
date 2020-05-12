# frozen_string_literal: true

class Article < ApplicationRecord
  validates_presence_of :title, :content

  has_many :comments
  belongs_to :author, class_name: 'User'

  def to_builder
    Jbuilder.new do |article|
      article.title title
      article.content content
			article.author author.email
    end
  end
end
