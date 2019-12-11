# frozen_string_literal: true

require 'test_helper'

class Web::Articles::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:published)
    @comment = article_comments(:one)
  end

  test 'should create' do
    comment_attrs = { body: @comment.body, commentor: @comment.commentor }

    post article_comments_url(@article), params: { article_comment: comment_attrs }

    assert_response :redirect

    assert { Article::Comment.exists? id: @comment }
  end

  test 'should destroy' do
    delete article_comment_url(@article, @comment)
    assert_response :redirect

    assert { !Article::Comment.exists? id: @comment }
  end
end
