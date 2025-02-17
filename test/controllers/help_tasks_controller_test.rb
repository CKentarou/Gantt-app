require "test_helper"

class HelpTasksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get help_tasks_index_url
    assert_response :success
  end

  test "should get new" do
    get help_tasks_new_url
    assert_response :success
  end

  test "should get show" do
    get help_tasks_show_url
    assert_response :success
  end

  test "should get edit" do
    get help_tasks_edit_url
    assert_response :success
  end
end
