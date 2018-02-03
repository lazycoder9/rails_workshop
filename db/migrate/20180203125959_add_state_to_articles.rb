class AddStateToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :state, :string, null: false, default: 'draft'
  end
end
