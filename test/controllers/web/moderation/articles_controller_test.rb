require 'test_helper'

class Web::Moderation::ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:on_moderate)
  end

  test 'should get index' do
    get moderation_articles_url

    assert_response :success
  end

  test 'should get show' do
    get moderation_article_url(@article)

    assert_response :success
  end

  test 'gets edit' do
    get edit_moderation_article_url(@article)

    assert_response :success
  end

  test 'patch update' do
    patch moderation_article_url(@article), params: { article: { state_event: 'publish' } }

    assert { @article.reload.published? }
  end
end
