require 'test_helper'

class ProjectionsControllerTest < ActionController::TestCase
  setup do
    @projection = projections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create projection" do
    assert_difference('Projection.count') do
      post :create, projection: { info: @projection.info, title: @projection.title, user_num: @projection.user_num }
    end

    assert_redirected_to projection_path(assigns(:projection))
  end

  test "should show projection" do
    get :show, id: @projection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @projection
    assert_response :success
  end

  test "should update projection" do
    patch :update, id: @projection, projection: { info: @projection.info, title: @projection.title, user_num: @projection.user_num }
    assert_redirected_to projection_path(assigns(:projection))
  end

  test "should destroy projection" do
    assert_difference('Projection.count', -1) do
      delete :destroy, id: @projection
    end

    assert_redirected_to projections_path
  end
end
