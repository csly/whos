class AddFacebookToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :facebook, :string
  end
end
