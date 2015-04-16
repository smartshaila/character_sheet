require 'test_helper'

class PreparedSpellsControllerTest < ActionController::TestCase
  setup do
    @prepared_spell = prepared_spells(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prepared_spells)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prepared_spell" do
    assert_difference('PreparedSpell.count') do
      post :create, prepared_spell: { character_id: @prepared_spell.character_id, is_cast: @prepared_spell.is_cast, spell_id: @prepared_spell.spell_id }
    end

    assert_redirected_to prepared_spell_path(assigns(:prepared_spell))
  end

  test "should show prepared_spell" do
    get :show, id: @prepared_spell
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prepared_spell
    assert_response :success
  end

  test "should update prepared_spell" do
    patch :update, id: @prepared_spell, prepared_spell: { character_id: @prepared_spell.character_id, is_cast: @prepared_spell.is_cast, spell_id: @prepared_spell.spell_id }
    assert_redirected_to prepared_spell_path(assigns(:prepared_spell))
  end

  test "should destroy prepared_spell" do
    assert_difference('PreparedSpell.count', -1) do
      delete :destroy, id: @prepared_spell
    end

    assert_redirected_to prepared_spells_path
  end
end
