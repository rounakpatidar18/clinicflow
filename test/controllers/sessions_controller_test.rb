require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get login_path
    assert_response :success
  end

  test "should login with valid credentials" do
    post login_path, params: { email: users(:one).email, password: "password" }

    assert_redirected_to root_path
    follow_redirect!
    assert_response :success
  end

  test "should not login with invalid credentials" do
    post login_path, params: { email: users(:one).email, password: "wrong-password" }

    assert_response :unprocessable_entity
    assert_includes @response.body, "Invalid credentials"
  end

  test "should logout" do
    post login_path, params: { email: users(:one).email, password: "password" }
    delete logout_path

    assert_redirected_to login_path

    get root_path
    assert_redirected_to login_path
  end
end
