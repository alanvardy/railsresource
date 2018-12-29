require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
  end

  test "shouldn't get index when not logged in" do
    get categories_url
    assert_redirected_to new_session_path
  end

  test "should get index when logged in" do
    login_user
    get categories_url
    assert_response :success
  end

  test "shouldn't get new when not logged in" do
    get new_category_url
    assert_redirected_to new_session_path
  end

  test "should get new when logged in" do
    login_user
    get new_category_url
    assert_response :success
  end

  test "shouldn't create category when not logged in" do
    assert_no_difference('Category.count') do
      post categories_url, params: { category: { description: @category.description, title: @category.title } }
    end

    assert_redirected_to new_session_path
  end

  test "should create category when logged in" do
    login_user
    assert_difference('Category.count', 1) do
      post categories_url, params: { category: { description: @category.description, title: @category.title } }
    end

    assert_redirected_to category_url(Category.last)
  end

  test "shouldn't show category when not logged in" do
    get category_url(@category)
    assert_redirected_to new_session_path
  end

  test "should show category when logged in" do
    login_user
    get category_url(@category)
    assert_response :success
  end

  test "shouldn't get edit when not logged in" do
    get edit_category_url(@category)
    assert_redirected_to new_session_path
  end

  test "should get edit when logged in" do
    login_user
    get edit_category_url(@category)
    assert_response :success
  end

  test "shouldn't update category when not logged in" do
    patch category_url(@category), params: { category: { description: @category.description, title: @category.title } }
    assert_redirected_to new_session_path
  end

  test "should update category when logged in" do
    login_user
    patch category_url(@category), params: { category: { description: @category.description, title: @category.title } }
    assert_redirected_to category_url(@category)
  end

  test "shouldn't destroy category when not logged in" do
    assert_no_difference('Category.count') do
      delete category_url(@category)
    end

    assert_redirected_to new_session_path
  end

  test "should destroy category" do
    login_user
    assert_difference('Category.count', -1) do
      delete category_url(@category)
    end

    assert_redirected_to categories_url
  end
end
