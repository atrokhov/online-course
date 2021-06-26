require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def auth_user(user_role)
    first_name = user_role.to_s + 
    last_name = "User"
    email = user_role.to_s + "User@example.com"
    return user = User.create(first_name: first_name, last_name: last_name,email: email, password: "qwerty123", password_confirmation: "qwerty123", role: user_role)
  end

  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should get show" do
    category = Category.create(name: "Test", description: "Test")
    get category_path(category.id)
    assert_response :success
  end

  test "should get new" do
    user = auth_user(:superuser)
    sign_in user
    get new_category_url
    assert_response :success
    sign_out user
  end

  test "should get edit" do
    category = Category.create(name: "Test", description: "Test")
    user = auth_user(:superuser)
    sign_in user
    get edit_category_path(category.id)
    assert_response :success
    sign_out user
  end

  test "shouldn't get new without login" do
    get new_category_url
    assert_response :found
  end

  test "shouldn't get edit without login" do
    category = Category.create(name: "Test", description: "Test")
    get edit_category_path(category.id)
    assert_response :found
  end

  test "shouldn't get new with another account" do
    user = auth_user(:client)
    sign_in user
    get new_category_url
    assert_response :found
    sign_out user
  end

  test "shouldn't get edit with another account" do
    category = Category.create(name: "Test", description: "Test")
    user = auth_user(:client)
    sign_in user
    get edit_category_path(category.id)
    assert_response :found
    sign_out user
  end

  test "superuser should create new category" do
    user = auth_user(:superuser)
    sign_in user
    post categories_url, params: { category: { name: "Test", description: "Test" } }
    assert_response :found
    assert_equal [Category.last.name, Category.last.description], ["Test", "Test"]
    sign_out user
  end

  test "superuser should update category name" do
    category = Category.create(name: "Test", description: "Test")
    user = auth_user(:superuser)
    sign_in user
    patch category_path(category.id), params: { category: { name: "Test1" } }
    assert_response :found
    assert_equal Category.last.name, "Test1"
    sign_out user
  end

  test "superuser should update category description" do
    category = Category.create(name: "Test", description: "Test")
    user = auth_user(:superuser)
    sign_in user
    patch category_path(category.id), params: { category: { description: "Test1" } }
    assert_response :found
    assert_equal Category.last.description, "Test1"
    sign_out user
  end

  test "superuser should update full category" do
    category = Category.create(name: "Test", description: "Test")
    user = auth_user(:superuser)
    sign_in user
    patch category_path(category.id), params: { category: { name: "Test1", description: "Test1" } }
    assert_response :found
    assert_equal [Category.last.name, Category.last.description], ["Test1", "Test1"]
    sign_out user
  end

  test "superuser should destroy category" do
    category = Category.create(name: "Test", description: "Test")
    user = auth_user(:superuser)
    sign_in user
    delete category_path(category.id)
    assert_response :found
    assert_empty Category.all
    sign_out user
  end

  test "not superuser shouldn't create new category" do
    user = auth_user(:client)
    sign_in user
    post categories_url, params: { category: { name: "Test", description: "Test" } }
    assert_response :found
    assert_empty Category.all
    sign_out user
  end

  test "not superuser shouldn't update category name" do
    category = Category.create(name: "Test", description: "Test")
    user = auth_user(:client)
    sign_in user
    patch category_path(category.id), params: { category: { name: "Test1" } }
    assert_response :found
    assert_equal Category.last.name, "Test"
    sign_out user
  end

  test "not superuser shouldn't update category description" do
    category = Category.create(name: "Test", description: "Test")
    user = auth_user(:client)
    sign_in user
    patch category_path(category.id), params: { category: { description: "Test1" } }
    assert_response :found
    assert_equal Category.last.description, "Test"
    sign_out user
  end

  test "not superuser shouldn't update full category" do
    category = Category.create(name: "Test", description: "Test")
    user = auth_user(:client)
    sign_in user
    patch category_path(category.id), params: { category: { name: "Test1", description: "Test1" } }
    assert_response :found
    assert_equal [Category.last.name, Category.last.description], ["Test", "Test"]
    sign_out user
  end

  test "not superuser shouldn't destroy category" do
    category = Category.create(name: "Test", description: "Test")
    user = auth_user(:client)
    sign_in user
    delete category_path(category.id)
    assert_response :found
    assert_not_empty Category.all
    assert_equal [Category.last.name, Category.last.description], ["Test", "Test"]
    sign_out user
  end
end
