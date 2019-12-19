class AddAuthorToArticles < ActiveRecord::Migration[6.0]
  def change
    # add_reference :articles, :author, null: false, foreign_key: true
    add_column :articles, :author_id, :integer, null: false, foreign_key: true
  end
end
