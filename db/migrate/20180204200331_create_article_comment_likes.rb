class CreateArticleCommentLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :article_comment_likes do |t|
      t.integer :comment_id
      t.integer :article_id
      t.timestamps
    end
  end
end

