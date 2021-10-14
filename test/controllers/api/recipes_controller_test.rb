require "test_helper"

class RecipesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @recipe = create(:recipe)
    @ingredient_1 = @recipe.ingredients.first.split(' ').sample
  end

  test "search with one known ingredient returns a result" do
    get api_recipes_search_path(query: @ingredient_1)

    assert :success
    assert_equal ([@recipe]).to_json, response.body
  end
end
