require 'test_helper'

class AnimalAreasControllerTest < ActionController::TestCase
  setup do
    @animal_area = animal_areas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:animal_areas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create animal_area" do
    assert_difference('AnimalArea.count') do
      post :create, animal_area: { forward_sorting_area: @animal_area.forward_sorting_area, latitude: @animal_area.latitude, licenses_issued: @animal_area.licenses_issued, longitude: @animal_area.longitude }
    end

    assert_redirected_to animal_area_path(assigns(:animal_area))
  end

  test "should show animal_area" do
    get :show, id: @animal_area
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @animal_area
    assert_response :success
  end

  test "should update animal_area" do
    patch :update, id: @animal_area, animal_area: { forward_sorting_area: @animal_area.forward_sorting_area, latitude: @animal_area.latitude, licenses_issued: @animal_area.licenses_issued, longitude: @animal_area.longitude }
    assert_redirected_to animal_area_path(assigns(:animal_area))
  end

  test "should destroy animal_area" do
    assert_difference('AnimalArea.count', -1) do
      delete :destroy, id: @animal_area
    end

    assert_redirected_to animal_areas_path
  end
end
