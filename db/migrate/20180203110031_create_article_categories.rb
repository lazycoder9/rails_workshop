class CreateArticleCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :article_categories do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end

    add_reference :articles, :category
  end
end
