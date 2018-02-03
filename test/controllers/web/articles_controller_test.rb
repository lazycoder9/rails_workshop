require 'test_helper'

class Web::ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
  end

  test 'should get index' do
    get articles_url

    assert_response :success
  end

  test 'shoult get show' do
    get article_url(@article.id)

    assert_response :success
  end

  test 'should get new' do
    get new_article_url

    assert_response :success
  end

  test 'should create article' do
    article_attrs = { title: @article.title, text: @article.text }

    post articles_url, params: { article: article_attrs }

    assert_response :redirect
  end

  test 'should get edit' do
    article = articles(:one)

    get edit_article_url(article.id)

    assert_response :success
  end

  test 'should update' do
    patch article_url(@article.id), params: { article: { title: 'new_title' } }
    assert_response :redirect

    @article.reload

    assert { @article.title == 'new_title' }
  end

  test 'should destroy' do
    delete article_url(@article.id)
    assert_response :redirect

    assert { !Article.exists? id: @article }
  end
end
