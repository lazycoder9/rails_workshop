require 'test_helper'

class Web::ArticlesControllerTest < ActionDispatch::IntegrationTest
  def auth_headers
    user = 'viraj'
    pw = 'password'
    {
      'HTTP_AUTHORIZATION' =>
      ActionController::HttpAuthentication::Basic.encode_credentials(user,pw)
    }
  end

  test "gets index" do
    get articles_url

    assert_response :success
  end

  test "gets show" do
    article = articles(:one)

    get article_url(article.id)

    assert_response :success
  end

  test "gets new" do
    get new_article_url, headers: auth_headers

    assert_response :success
  end

  test "posts create" do
    article_attrs = { title: 'title' }

    assert_difference('Article.count', 1) do
      post articles_url, params: { article: article_attrs }, headers: auth_headers
    end
  end

  test "gets edit" do
    article = articles(:one)

    get edit_article_url(article.id), headers: auth_headers

    assert_response :success
  end

  test "patch update" do
    article = articles(:one)

    patch article_url(article.id), params: { article: { title: 'new_title' } }, headers: auth_headers

    updated_article = Article.find(article.id)
    assert_equal(updated_article.title, 'new_title')
  end

  test 'deteles destroy' do
    article = articles(:one)

    assert_difference('Article.count', -1) do
      delete article_url(article.id), headers: auth_headers
    end
  end
end