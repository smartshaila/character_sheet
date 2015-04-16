require 'test_helper'

class SpellTagsControllerTest < ActionController::TestCase
  setup do
    @spell_tag = spell_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spell_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spell_tag" do
    assert_difference('SpellTag.count') do
      post :create, spell_tag: { spell_id: @spell_tag.spell_id, tag_id: @spell_tag.tag_id }
    end

    assert_redirected_to spell_tag_path(assigns(:spell_tag))
  end

  test "should show spell_tag" do
    get :show, id: @spell_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spell_tag
    assert_response :success
  end

  test "should update spell_tag" do
    patch :update, id: @spell_tag, spell_tag: { spell_id: @spell_tag.spell_id, tag_id: @spell_tag.tag_id }
    assert_redirected_to spell_tag_path(assigns(:spell_tag))
  end

  test "should destroy spell_tag" do
    assert_difference('SpellTag.count', -1) do
      delete :destroy, id: @spell_tag
    end

    assert_redirected_to spell_tags_path
  end
end
