class Api::Recipes::SearchesController < ApplicationController
  def create
    render json: Recipe.search_by_ingredients(params[:query])
  end
end
