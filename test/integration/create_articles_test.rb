require 'test_helper'

class CreateArticlesTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: "jonn", email: "john@example.com", password: "password")
  end

  test "get new article form and create article" do
    sign_in_as(@user, "password")
    get new_article_path
    assert_template 'articles/new'
    assert_difference 'Article.count', 1 do
    post articles_path, params: {article: {title: "article test", description: "this is article test"}}
    follow_redirect!
    end
    assert_template 'articles/show'
    assert_match "article test", response.body
  end

  test "invalid article submission result in failure" do
    sign_in_as(@user, "password")
    get new_article_path
    assert_template 'articles/new'
    assert_no_difference 'Article.count' do
    post articles_path, params: {article: {title: " ", description: "without title"}}
    post articles_path, params: {article: {title: "without description ", description: " "}}
        end
    assert_template 'articles/new'
    assert_select 'h2.alert-title'
    assert_select 'div.panel-body'
  end

end
