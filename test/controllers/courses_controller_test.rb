require "test_helper"

class CoursesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def auth_user(class_name)
    user = User.create(username: "testUser", email: "test_user@eample.com", password: "qwerty123", password_confirmation: "qwerty123")
    class_name.create(user: user)
    sign_in user
  end

  test "should get index" do
    get courses_url
    assert_response :success
  end

  test "should get show" do
    category = Category.create(name: "Test")
    course = Course.create(category: category, name: "Test", description: "Test")
    get course_path(course.id)
    assert_response :success
  end

  test "should get new" do
    auth_user(Superuser)
    get new_course_url
    assert_response :success
  end

  test "should get edit" do
    category = Category.create(name: "Test")
    course = Course.create(category: category, name: "Test", description: "Test")
    auth_user(Superuser)
    get edit_course_path(course.id)
    assert_response :success
  end

  test "shouldn't get new without login" do
    get new_course_url
    assert_response :found
  end

  test "shouldn't get edit without login" do
    category = Category.create(name: "Test")
    course = Course.create(category: category, name: "Test", description: "Test")
    get edit_course_path(course.id)
    assert_response :found
  end

  test "shouldn't get new with another account" do
    auth_user(Client)
    get new_course_url
    assert_response :found
  end

  test "shouldn't get edit with another account" do
    category = Category.create(name: "Test")
    course = Course.create(category: category, name: "Test", description: "Test")
    auth_user(Client)
    get edit_course_path(course.id)
    assert_response :found
  end

  test "superuser should create new course" do
    category = Category.create(name: "Test")
    auth_user(Superuser)
    puts category.id
    post courses_url, params: { course: { category_id: category.id, name: "Test", description: "Test" } }
    assert_response :found
    assert_equal [Course.last.name, Course.last.description], ["Test", "Test"]
  end

  test "superuser should update course name" do
    category = Category.create(name: "Test")
    course = Course.create(category: category, name: "Test", description: "Test")
    auth_user(Superuser)
    patch course_path(course.id), params: { course: { name: "Test1" } }
    assert_response :found
    assert_equal Course.last.name, "Test1"
  end

  test "superuser should update course description" do
    category = Category.create(name: "Test")
    course = Course.create(category: category, name: "Test", description: "Test")
    auth_user(Superuser)
    patch course_path(course.id), params: { course: { description: "Test1" } }
    assert_response :found
    assert_equal Course.last.description, "Test1"
  end

  test "superuser should update full course" do
    category = Category.create(name: "Test")
    course = Course.create(category: category, name: "Test", description: "Test")
    auth_user(Superuser)
    patch course_path(course.id), params: { course: { name: "Test1", description: "Test1" } }
    assert_response :found
    assert_equal [Course.last.name, Course.last.description], ["Test1", "Test1"]
  end

  test "superuser should destroy course" do
    category = Category.create(name: "Test")
    course = Course.create(category: category, name: "Test", description: "Test")
    auth_user(Superuser)
    delete course_path(course.id)
    assert_response :found
    assert_empty Course.all
  end

  test "not superuser shouldn't create new course" do
    auth_user(Client)
    post courses_url, params: { course: { name: "Test", description: "Test" } }
    assert_response :found
    assert_empty Course.all
  end

  test "not superuser shouldn't update course name" do
    category = Category.create(name: "Test")
    course = Course.create(category: category, name: "Test", description: "Test")
    auth_user(Client)
    patch course_path(course.id), params: { course: { name: "Test1" } }
    assert_response :found
    assert_equal Course.last.name, "Test"
  end

  test "not superuser shouldn't update course description" do
    category = Category.create(name: "Test")
    course = Course.create(category: category, name: "Test", description: "Test")
    auth_user(Client)
    patch course_path(course.id), params: { course: { description: "Test1" } }
    assert_response :found
    assert_equal Course.last.description, "Test"
  end

  test "not superuser shouldn't update full course" do
    category = Category.create(name: "Test")
    course = Course.create(category: category, name: "Test", description: "Test")
    auth_user(Client)
    patch course_path(course.id), params: { course: { name: "Test1", description: "Test1" } }
    assert_response :found
    assert_equal [Course.last.name, Course.last.description], ["Test", "Test"]
  end

  test "not superuser shouldn't destroy course" do
    category = Category.create(name: "Test")
    course = Course.create(category: category, name: "Test", description: "Test")
    auth_user(Client)
    delete course_path(course.id)
    assert_response :found
    assert_not_empty Course.all
    assert_equal [Course.last.name, Course.last.description], ["Test", "Test"]
  end
end
