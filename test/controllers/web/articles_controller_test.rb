require 'test_helper'

class Web::ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:draft)
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
    assert { Article.exists? id: @article }
    assert { @article.draft? }
  end

  test 'should get edit' do
    get edit_article_url(@article)

    assert_response :success
  end

  test 'should update' do
    article_attrs = { title: 'new_title' }
    patch article_url(@article.id), params: { article: article_attrs }
    assert_response :redirect

    @article.reload

    assert { @article.title == article_attrs[:title] }
  end

  test 'should destroy' do
    delete article_url(@article)
    assert_response :redirect

    assert { !Article.exists? id: @article }
  end

  test 'should send to moderation' do
    article = articles(:draft)
    patch send_to_moderation_article_path(article)
    assert_response :redirect
    assert { article.reload.on_moderate? }
  end
end
