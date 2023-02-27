require "test_helper"

class DoppelgsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get doppelgs_new_url
    assert_response :success
  end

  test "should get create" do
    get doppelgs_create_url
    assert_response :success
  end

  test "should get index" do
    get doppelgs_index_url
    assert_response :success
  end

  test "should get show" do
    get doppelgs_show_url
    assert_response :success
  end

  test "should get edit" do
    get doppelgs_edit_url
    assert_response :success
  end

  test "should get update" do
    get doppelgs_update_url
    assert_response :success
  end

  test "should get destroy" do
    get doppelgs_destroy_url
    assert_response :success
  end
end
