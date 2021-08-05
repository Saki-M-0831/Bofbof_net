require 'test_helper'

class Admin::VideosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_videos_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_videos_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_videos_edit_url
    assert_response :success
  end

end
