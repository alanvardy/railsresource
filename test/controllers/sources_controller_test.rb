require 'test_helper'

class SourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @source = sources(:one)
  end

  test "shouldn't get index when not logged in" do
    get sources_url
    assert_redirected_to new_session_path
  end

  test "should get index when logged in" do
    login_user
    get sources_url
    assert_response :success
  end

  test "shouldn't get new when not logged in" do
    get new_source_url
    assert_redirected_to new_session_path
  end

  test "should get new when logged in" do
    login_user
    get new_source_url
    assert_response :success
  end

  test "shouldn't create source when not logged in" do
    assert_no_difference('Source.count') do
      post sources_url, params: { source: { abbr: @source.abbr, color: @source.color, title: @source.title } }
    end

    assert_redirected_to new_session_path
  end

  test "should create source when logged in" do
    login_user
    assert_difference('Source.count', 1) do
      post sources_url, params: { source: { abbr: @source.abbr, color: @source.color, title: @source.title } }
    end

    assert_redirected_to source_url(Source.last)
  end

  test "shouldn't show source when not logged in" do
    get source_url(@source)
    assert_redirected_to new_session_path
  end

  test "should show source when logged in" do
    login_user
    get source_url(@source)
    assert_response :success
  end

  test "shouldn't get edit when not logged in" do
    get edit_source_url(@source)
    assert_redirected_to new_session_path
  end

  test "should get edit when logged in" do
    login_user
    get edit_source_url(@source)
    assert_response :success
  end

  test "shouldn't update source when not logged in" do
    patch source_url(@source), params: { source: { abbr: @source.abbr, color: @source.color, title: @source.title } }
    assert_redirected_to new_session_path
  end

  test "should update source when logged in" do
    login_user
    patch source_url(@source), params: { source: { abbr: @source.abbr, color: @source.color, title: @source.title } }
    assert_redirected_to source_url(@source)
  end

  test "shouldn't destroy source when not logged in" do
    assert_no_difference('Source.count') do
      delete source_url(@source)
    end

    assert_redirected_to new_session_path
  end

  test "should destroy source when logged in" do
    login_user
    assert_difference('Source.count', -1) do
      delete source_url(@source)
    end

    assert_redirected_to sources_url
  end
end
