require 'test_helper'

class FencersControllerTest < ActionController::TestCase
  setup do
    @fencer = fencers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fencers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fencer" do
    assert_difference('Fencer.count') do
      post :create, fencer: {  }
    end

    assert_redirected_to fencer_path(assigns(:fencer))
  end

  test "should show fencer" do
    get :show, id: @fencer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fencer
    assert_response :success
  end

  test "should update fencer" do
    patch :update, id: @fencer, fencer: {  }
    assert_redirected_to fencer_path(assigns(:fencer))
  end

  test "should destroy fencer" do
    assert_difference('Fencer.count', -1) do
      delete :destroy, id: @fencer
    end

    assert_redirected_to fencers_path
  end
end
