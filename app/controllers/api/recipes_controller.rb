class Api::RecipesController < ApplicationController
  def search
    render json: Recipe.search_by_ingredients(params[:query])
  end
end
