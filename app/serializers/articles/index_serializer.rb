# frozen_string_literal: true

class Articles::IndexSerializer < ActiveModel::Serializer
  include ActionView::Helpers::TextHelper
  attributes :id, :title, :content, :author, :created_at

  def content
    truncate(object.content, length: 35, omission: '... (continued)')
  end

  def created_at
    {
      unix_timestamp: object.created_at.to_time.to_i,
      full_date_time: object.created_at.to_formatted_s(:long),
      short_date: object.created_at.strftime('%F')

    }
  end

  def author
    Users::ShowSerializer.new(object.author)
  end
end
