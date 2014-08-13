class AddPriorityToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :priority, :string
  end
end
