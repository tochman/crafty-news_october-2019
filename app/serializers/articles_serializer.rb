class ArticlesSerializer < ActiveModel::Serializer
	attributes :id, :title, :content, :author

	def author
		object.author.email
	end


end
