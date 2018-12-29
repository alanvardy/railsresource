# frozen_string_literal: true

require 'test_helper'

class ResourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resource = resources(:one)
  end

  test "shouldn't get index when not logged in" do
    get resources_url
    assert_redirected_to new_session_path
  end

  test 'should get index when logged in' do
    login_user
    get resources_url
    assert_response :success
  end

  test "shouldn't get new when not logged in" do
    get new_resource_url
    assert_redirected_to new_session_path
  end

  test 'should get new when logged in' do
    login_user
    get new_resource_url
    assert_response :success
  end

  # test 'should create resource when logged in' do
  #   login_user
  #   assert_difference('Resource.count') do
  #     post resources_url, params: { resource: { description: @resource.description, title: @resource.title, url: @resource.url, topic_id: @resource.topic_id, source_id: @resource.source_id } }
  #   end

  #   assert_redirected_to resource_url(Resource.last)
  # end

  test "shouldn't create resource when not logged in" do
    assert_no_difference('Resource.count') do
      post resources_url, params: { resource: { description: @resource.description, title: @resource.title, url: @resource.url, topic_id: @resource.topic_id, source_id: @resource.source_id } }
    end

    assert_redirected_to session_new_path
  end

  test 'should show resource when logged in' do
    login_user
    get resource_url(@resource)
    assert_response :success
  end

  test "shouldn't show resource when not logged in" do
    get resource_url(@resource)
    assert_redirected_to session_new_path
  end

  test "shouldn't get edit when not logged in" do
    get edit_resource_url(@resource)
    assert_redirected_to session_new_path
  end

  test 'should get edit when logged in' do
    login_user
    get edit_resource_url(@resource)
    assert_response :success
  end

  # test "should update resource" do
  #   patch resource_url(@resource), params: { resource: { description: @resource.description, title: @resource.title, url: @resource.url } }
  #   assert_redirected_to resource_url(@resource)
  # end

  test "shouldn't destroy resource when not logged in" do
    assert_no_difference('Resource.count') do
      delete resource_url(@resource)
    end

    assert_redirected_to session_new_path
  end

  test 'should destroy resource when logged in' do
    login_user
    assert_difference('Resource.count', -1) do
      delete resource_url(@resource)
    end

    assert_redirected_to resources_url
  end
end
