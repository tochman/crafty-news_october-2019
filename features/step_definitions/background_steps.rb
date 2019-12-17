Given("the following articles exist(:)") do |table|
  table.hashes.each do |article_attrs|
    if article_attrs.keys.include? 'author'
      user = User.find_by(email: article_attrs[:author])
      attrs = article_attrs.except('author').merge(author: user)
    else
      attrs = article_attrs
    end
    create(:article, attrs)
  end
end

Given("the following users exist") do |table|
  table.hashes.each do |user_attrs|
    create(:user, user_attrs)
  end
end