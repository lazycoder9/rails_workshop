require 'test_helper'

class Web::Articles::CommentsControllerTest < ActionDispatch::IntegrationTest
  def auth_headers
    user = 'viraj'
    pw = 'password'
    {
      'HTTP_AUTHORIZATION' =>
      ActionController::HttpAuthentication::Basic.encode_credentials(user,pw)
    }
  end

  setup do
    @article = articles(:one)
  end

  test 'should create' do
    assert_difference('Article::Comment.count', 1) do
      post article_comments_url(@article.id), params: { article_comment: { body: 'body', commentor: 'commentor' } }
    end

    comment = @article.comments.find_by(body: 'body', commentor: 'commentor')
    assert_equal(comment.present?, true)
  end

  test 'should destroy' do
    comment = @article.comments.first

    assert_difference('Article::Comment.count', -1) do
      delete article_comment_url(@article.id, comment.id), headers: auth_headers
    end
  end
end