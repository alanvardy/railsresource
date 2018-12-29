# frozen_string_literal: true

require 'test_helper'

class TopicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @topic = topics(:one)
  end

  test "shouldn't get index when not logged in" do
    get topics_url
    assert_redirected_to session_new_path
  end

  test 'should get index when logged in' do
    login_user
    get topics_url
    assert_response :success
  end

  test "shouldn't get get new when not logged in" do
    get new_topic_url
    assert_redirected_to session_new_path
  end

  test 'should get new when logged in' do
    login_user
    get new_topic_url
    assert_response :success
  end

  # test 'should create topic when logged in' do
  #   login_user
  #   assert_difference('Topic.count') do
  #     post topics_url, params: { topic: { title: 'Blah', category_id: 2 } }
  #   end
  #   assert_redirected_to topic_url(Topic.last)
  # end

  # test "shouldn't create topic when not logged in" do
  #   assert_no_difference('Topic.count') do
  #     post topics_url, params: { topic: { title: @topic.title, category_id: 2 } }
  #   end

  #   assert_redirected_to session_new_path
  # end

  # test "should show topic" do
  #   get topic_url(@topic)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_topic_url(@topic)
  #   assert_response :success
  # end

  # test "should update topic" do
  #   patch topic_url(@topic), params: { topic: { title: @topic.title } }
  #   assert_redirected_to topic_url(@topic)
  # end

  test "shouldn't destroy topic when not logged in" do
    assert_no_difference('Topic.count') do
      delete topic_url(@topic)
    end

    assert_redirected_to session_new_path
  end

  test 'should destroy topic when logged in' do
    login_user
    assert_difference('Topic.count', -1) do
      delete topic_url(@topic)
    end

    assert_redirected_to topics_url
  end
end
