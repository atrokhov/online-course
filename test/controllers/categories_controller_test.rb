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
    user = auth_user(:client)
    sign_in user

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
    sign_out user
  end

  test "Superuser users must get all views" do
    category = Category.create(name: "Test", description: "Test")
    user = auth_user(:superuser)
    sign_in user

################POST#####################
    post categories_url, params: { category: { name: "Test1"} }
    assert_response :success
    assert_equal [Category.last.name, Category.last.description], ["Test1", ""]

    post categories_url, params: { category: { description: "Test1" } }
    assert_response :success
    assert_equal [Category.last.name, Category.last.description], ["", "Test1"]

    post categories_url, params: { category: { name: "Test1", description: "Test1" } }
    assert_response :success
    assert_equal [Category.last.name, Category.last.description], ["Test1", "Test1"]

################PATCH####################
    patch category_path(category.id), params: { category: { name: "Test2", description: "Test2" } }
    assert_response :success
    assert_equal [Category.last.name, Category.last.description], ["Test2", "Test2"]

    patch category_path(category.id), params: { category: { name: "Test3" } }
    assert_response :success
    assert_equal [Category.last.name, Category.last.description], ["Test3", "Test2"]

    patch category_path(category.id), params: { category: { description: "Test3" } }
    assert_response :success
    assert_equal [Category.last.name, Category.last.description], ["Test3", "Test3"]

################DELETE###################
    delete category_path(category.id)
    assert_response :success
    assert_not_empty Category.all
    assert_not_includes Category.all, category
    sign_out user

################GET######################
    get categories_url
    assert_response :success

    get category_path(category.id)
    assert_response :success

    get new_category_url
    assert_response :success

    get edit_category_path(category.id)
    assert_response :success
  end

  private

      def auth_user(user_role)
        first_name = user_role.to_s + 
        last_name = "User"
        email = user_role.to_s + "User@example.com"
        return user = User.create(first_name: first_name, last_name: last_name,email: email, password: "qwerty123", password_confirmation: "qwerty123", role: user_role)
        Basket.create(user: user)
      end
end
