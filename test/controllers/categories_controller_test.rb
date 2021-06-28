require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "Unautorized users must get index and show, another views must not to be accessed" do
    category = Category.create(name: "Test", description: "Test")

    get categories_url
    assert_response :success

    get category_path(category.id)
    assert_response :success

    get new_category_url
    assert_response :found

    get edit_category_path(category.id)
    assert_response :found

    post categories_url, params: { category: { name: "Test1", description: "Test1" } }
    assert_response :found
    assert_equal [Category.last.name, Category.last.description], ["Test", "Test"]

    post categories_url, params: { category: { name: "Test1"} }
    assert_response :found
    assert_equal [Category.last.name, Category.last.description], ["Test", "Test"]

    post categories_url, params: { category: { description: "Test1" } }
    assert_response :found
    assert_equal [Category.last.name, Category.last.description], ["Test", "Test"]

    patch category_path(category.id), params: { category: { name: "Test1", description: "Test1" } }
    assert_response :found
    assert_equal [Category.last.name, Category.last.description], ["Test", "Test"]

    patch category_path(category.id), params: { category: { name: "Test1" } }
    assert_response :found
    assert_equal [Category.last.name, Category.last.description], ["Test", "Test"]

    patch category_path(category.id), params: { category: { description: "Test1" } }
    assert_response :found
    assert_equal [Category.last.name, Category.last.description], ["Test", "Test"]

    delete category_path(category.id)
    assert_response :found
    assert_not_empty Category.all
    assert_equal [Category.last.name, Category.last.description], ["Test", "Test"]
  end

  test "Not superuser users must get index and show, another views must not to be accessed" do
    category = Category.create(name: "Test", description: "Test")
    get user_session_url
    sign_in users(:client1)
    post user_session_url

################GET######################
    get categories_url
    assert_response :success

    get category_path(category.id)
    assert_response :success

    get new_category_url
    assert_response :found

    get edit_category_path(category.id)
    assert_response :found

################POST#####################
    post categories_url, params: { category: { name: "Test1", description: "Test1" } }
    assert_response :found
    assert_equal [Category.last.name, Category.last.description], ["Test", "Test"]

    post categories_url, params: { category: { name: "Test1"} }
    assert_response :found
    assert_equal [Category.last.name, Category.last.description], ["Test", "Test"]

    post categories_url, params: { category: { description: "Test1" } }
    assert_response :found
    assert_equal [Category.last.name, Category.last.description], ["Test", "Test"]

################PATCH####################
    patch category_path(category.id), params: { category: { name: "Test1", description: "Test1" } }
    assert_response :found
    assert_equal [Category.last.name, Category.last.description], ["Test", "Test"]

    patch category_path(category.id), params: { category: { name: "Test1" } }
    assert_response :found
    assert_equal [Category.last.name, Category.last.description], ["Test", "Test"]

    patch category_path(category.id), params: { category: { description: "Test1" } }
    assert_response :found
    assert_equal [Category.last.name, Category.last.description], ["Test", "Test"]

################DELETE###################
    delete category_path(category.id)
    assert_response :found
    assert_not_empty Category.all
    assert_equal [Category.last.name, Category.last.description], ["Test", "Test"]
    sign_out users(:client1)
  end

  test "Superuser users must get all views" do
    category = Category.create(name: "Test", description: "Test")
    get user_session_url
    sign_in users(:superuser)
    post user_session_url

################GET######################
    get categories_url
    assert_response :success

    get category_path(category.id)
    assert_response :success

    get new_category_url
    assert_response :success

    get edit_category_path(category.id)
    assert_response :success

################POST#####################
    post categories_url, params: { category: { name: "Test1"} }
    assert_response :found
    assert_equal [Category.last.name, Category.last.description], ["Test1", ""]

    post categories_url, params: { category: { description: "Test1" } }
    assert_response :unprocessable_entity
    assert_not_equal [Category.last.name, Category.last.description], ["", "Test1"]

    post categories_url, params: { category: { name: "Test1", description: "Test1" } }
    assert_response :found
    assert_equal [Category.last.name, Category.last.description], ["Test1", "Test1"]

################PATCH####################
    patch category_path(category.id), params: { category: { name: "Test2", description: "Test2" } }
    assert_response :found
    assert_equal [Category.find(category.id).name, Category.find(category.id).description], ["Test2", "Test2"]

    patch category_path(category.id), params: { category: { name: "Test3" } }
    assert_response :found
    assert_equal [Category.find(category.id).name, Category.find(category.id).description], ["Test3", "Test2"]

    patch category_path(category.id), params: { category: { description: "Test3" } }
    assert_response :found
    assert_equal [Category.find(category.id).name, Category.find(category.id).description], ["Test3", "Test3"]

################DELETE###################
    category_for_destroy = Category.create(name: "Test", description: "Test")
    delete category_path(category.id)
    assert_response :found
    assert_not_empty Category.all
    assert_not_includes Category.all, category
    sign_out users(:superuser)
  end
end
