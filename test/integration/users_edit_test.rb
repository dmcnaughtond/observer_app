require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:rocky)
  end

  test "unsuccessful edit" do
  	log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name:  "",
                                              email: "foo@invalid",
                                              school: "",
                                              password:              "foo",
                                              password_confirmation: "bar" } }

    
    assert_select 'div.alert.alert-danger', "The form contains 5 errors."
    assert_template 'users/edit'
  end

  test "successful edit with friendly forwarding" do

    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
    name  = "Foo Bar"
    email = "foo@bar.com"
    school = "Foo Bar Elementary"
    patch user_path(@user), params: { user: { name:  name,
                                              email: email,
                                              school: school,
                                              password:              "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name,  @user.name
    assert_equal email, @user.email
    assert_nil session[:forward_url]
    log_in_as(@user)
    assert_redirected_to @user
  end
end
