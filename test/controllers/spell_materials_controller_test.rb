require 'test_helper'

class SpellMaterialsControllerTest < ActionController::TestCase
  setup do
    @spell_material = spell_materials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spell_materials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spell_material" do
    assert_difference('SpellMaterial.count') do
      post :create, spell_material: { description: @spell_material.description, is_consumed: @spell_material.is_consumed, spell_id: @spell_material.spell_id, value: @spell_material.value }
    end

    assert_redirected_to spell_material_path(assigns(:spell_material))
  end

  test "should show spell_material" do
    get :show, id: @spell_material
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spell_material
    assert_response :success
  end

  test "should update spell_material" do
    patch :update, id: @spell_material, spell_material: { description: @spell_material.description, is_consumed: @spell_material.is_consumed, spell_id: @spell_material.spell_id, value: @spell_material.value }
    assert_redirected_to spell_material_path(assigns(:spell_material))
  end

  test "should destroy spell_material" do
    assert_difference('SpellMaterial.count', -1) do
      delete :destroy, id: @spell_material
    end

    assert_redirected_to spell_materials_path
  end
end
