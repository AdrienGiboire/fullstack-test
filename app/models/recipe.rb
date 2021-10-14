class Recipe < ApplicationRecord
  def self.search_by_ingredients ingredients
    ingredients = [ingredients] unless ingredients.is_a?(Array)

    where_clause = "EXISTS (SELECT FROM unnest(ingredients) ingredient WHERE 1=1 "
    ingredients.each do |ingredient|
      where_clause += "OR ingredient ILIKE '%#{ingredient}%'"
    end
    where_clause += ")"

    where(where_clause)
  end
end
