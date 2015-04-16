require 'test_helper'

class FavoriteSpellsControllerTest < ActionController::TestCase
  setup do
    @favorite_spell = favorite_spells(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:favorite_spells)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create favorite_spell" do
    assert_difference('FavoriteSpell.count') do
      post :create, favorite_spell: { player_id: @favorite_spell.player_id, spell_id: @favorite_spell.spell_id }
    end

    assert_redirected_to favorite_spell_path(assigns(:favorite_spell))
  end

  test "should show favorite_spell" do
    get :show, id: @favorite_spell
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @favorite_spell
    assert_response :success
  end

  test "should update favorite_spell" do
    patch :update, id: @favorite_spell, favorite_spell: { player_id: @favorite_spell.player_id, spell_id: @favorite_spell.spell_id }
    assert_redirected_to favorite_spell_path(assigns(:favorite_spell))
  end

  test "should destroy favorite_spell" do
    assert_difference('FavoriteSpell.count', -1) do
      delete :destroy, id: @favorite_spell
    end

    assert_redirected_to favorite_spells_path
  end
end
