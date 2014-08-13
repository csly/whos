class AddDeadlineToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :dead_line, :string
  end
end
