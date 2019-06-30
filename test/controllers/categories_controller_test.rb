require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: "sports")
  end

  test "should get categories index" do
    get '/categories'
    assert_response :success
  end

  test "should get new" do
    get '/categories/new'
    assert_response :success
  end

  test "should get show" do
    get category_url(@category)
    assert_response :success
  end
end
