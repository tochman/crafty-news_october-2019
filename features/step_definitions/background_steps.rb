Given("the following articles exist:") do |table|
  table.hashes.each do |article_attrs|
    create(:article, article_attrs)
  end
end