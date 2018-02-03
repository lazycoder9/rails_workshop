class CreateArticleLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :article_links do |t|
      t.string :url, null: false
      t.references :article, foreign_key: true
      t.timestamps
    end
  end
end
