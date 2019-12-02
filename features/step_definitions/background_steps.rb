Given("the following articles exist:") do |table|
  table.hashes.each do |article_attrs|
    Article.create(article_attrs)
  end
end