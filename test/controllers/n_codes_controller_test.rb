require 'test_helper'

class NCodesControllerTest < ActionController::TestCase
  setup do
    @n_code = n_codes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:n_codes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create n_code" do
    assert_difference('NCode.count') do
      post :create, n_code: { term: @n_code.term }
    end

    assert_redirected_to n_code_path(assigns(:n_code))
  end

  test "should show n_code" do
    get :show, id: @n_code
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @n_code
    assert_response :success
  end

  test "should update n_code" do
    patch :update, id: @n_code, n_code: { term: @n_code.term }
    assert_redirected_to n_code_path(assigns(:n_code))
  end

  test "should destroy n_code" do
    assert_difference('NCode.count', -1) do
      delete :destroy, id: @n_code
    end

    assert_redirected_to n_codes_path
  end
end
