json.set! 'meta-data' do
	json.page 1
	json.total_pages 3
end
json.set! 'articles' do
	json.array! @articles do |article|
		json.(article, :title, :content)
		json.created article.created_at.strftime('%F')
		json.author article.author.email
	end
end
