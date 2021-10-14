require "test_helper"

class RecipesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @recipe = create(:recipe)
    @ingredient_1 = @recipe.ingredients.first.split(' ').sample
    @ingredient_2 = @recipe.ingredients.last.split(' ').sample
  end

  test "search with one known ingredient returns a result" do
    get api_recipes_search_path(query: @ingredient_1)

    assert :success
    assert_equal ([@recipe]).to_json, response.body
  end

  test "search with several known ingredients returns a result" do
    get api_recipes_search_path(query: [@ingredient_1, @ingredient_2])

    assert :success
    assert_equal ([@recipe]).to_json, response.body
  end
end
