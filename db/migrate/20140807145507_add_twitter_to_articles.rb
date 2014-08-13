class AddTwitterToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :twitter, :string
  end
end
