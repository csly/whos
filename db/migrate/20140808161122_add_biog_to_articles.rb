class AddBiogToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :biog, :text
  end
end
