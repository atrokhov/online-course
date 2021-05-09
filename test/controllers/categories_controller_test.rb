require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def auth_user(class_name)
    user = User.create(username: "testUser", email: "test_user@eample.com", password: "qwerty123", password_confirmation: "qwerty123")
    class_name.create(user: user)
    sign_in user
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
    auth_user(Superuser)
    get new_category_url
    assert_response :success
  end

  test "should get edit" do
    category = Category.create(name: "Test", description: "Test")
    auth_user(Superuser)
    get edit_category_path(category.id)
    assert_response :success
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
    auth_user(Client)
    get new_category_url
    assert_response :found
  end

  test "shouldn't get edit with another account" do
    category = Category.create(name: "Test", description: "Test")
    auth_user(Client)
    get edit_category_path(category.id)
    assert_response :found
  end

  test "superuser should create new category" do
    auth_user(Superuser)
    post categories_url, params: { category: { name: "Test", description: "Test" } }
    assert_response :found
    assert_equal [Category.last.name, Category.last.description], ["Test", "Test"]
  end

  test "superuser should update category name" do
    category = Category.create(name: "Test", description: "Test")
    auth_user(Superuser)
    patch category_path(category.id), params: { category: { name: "Test1" } }
    assert_response :found
    assert_equal Category.last.name, "Test1"
  end

  test "superuser should update category description" do
    category = Category.create(name: "Test", description: "Test")
    auth_user(Superuser)
    patch category_path(category.id), params: { category: { description: "Test1" } }
    assert_response :found
    assert_equal Category.last.description, "Test1"
  end

  test "superuser should update full category" do
    category = Category.create(name: "Test", description: "Test")
    auth_user(Superuser)
    patch category_path(category.id), params: { category: { name: "Test1", description: "Test1" } }
    assert_response :found
    assert_equal [Category.last.name, Category.last.description], ["Test1", "Test1"]
  end

  test "superuser should destroy category" do
    category = Category.create(name: "Test", description: "Test")
    auth_user(Superuser)
    delete category_path(category.id)
    assert_response :found
    assert_empty Category.all
  end

  test "not superuser shouldn't create new category" do
    auth_user(Client)
    post categories_url, params: { category: { name: "Test", description: "Test" } }
    assert_response :found
    assert_empty Category.all
  end

  test "not superuser shouldn't update category name" do
    category = Category.create(name: "Test", description: "Test")
    auth_user(Client)
    patch category_path(category.id), params: { category: { name: "Test1" } }
    assert_response :found
    assert_equal Category.last.name, "Test"
  end

  test "not superuser shouldn't update category description" do
    category = Category.create(name: "Test", description: "Test")
    auth_user(Client)
    patch category_path(category.id), params: { category: { description: "Test1" } }
    assert_response :found
    assert_equal Category.last.description, "Test"
  end

  test "not superuser shouldn't update full category" do
    category = Category.create(name: "Test", description: "Test")
    auth_user(Client)
    patch category_path(category.id), params: { category: { name: "Test1", description: "Test1" } }
    assert_response :found
    assert_equal [Category.last.name, Category.last.description], ["Test", "Test"]
  end

  test "not superuser shouldn't destroy category" do
    category = Category.create(name: "Test", description: "Test")
    auth_user(Client)
    delete category_path(category.id)
    assert_response :found
    assert_not_empty Category.all
    assert_equal [Category.last.name, Category.last.description], ["Test", "Test"]
  end
end
