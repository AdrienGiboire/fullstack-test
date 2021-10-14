class Api::RecipesController < ApplicationController
  def search
    render json: Recipe.search_by_ingredient(params[:query])
  end
end
