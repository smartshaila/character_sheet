require 'test_helper'

class KnownSpellsControllerTest < ActionController::TestCase
  setup do
    @known_spell = known_spells(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:known_spells)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create known_spell" do
    assert_difference('KnownSpell.count') do
      post :create, known_spell: { character_id: @known_spell.character_id, spell_id: @known_spell.spell_id }
    end

    assert_redirected_to known_spell_path(assigns(:known_spell))
  end

  test "should show known_spell" do
    get :show, id: @known_spell
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @known_spell
    assert_response :success
  end

  test "should update known_spell" do
    patch :update, id: @known_spell, known_spell: { character_id: @known_spell.character_id, spell_id: @known_spell.spell_id }
    assert_redirected_to known_spell_path(assigns(:known_spell))
  end

  test "should destroy known_spell" do
    assert_difference('KnownSpell.count', -1) do
      delete :destroy, id: @known_spell
    end

    assert_redirected_to known_spells_path
  end
end
