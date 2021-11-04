class Recipe < ApplicationRecord
  def self.search_by_ingredients ingredients
    return [] if ingredients.nil?

    ingredients = [ingredients] unless ingredients.is_a?(Array)

    where_clause = ""
    ingredients.each do |ingredient|
      where_clause += " AND " unless where_clause.empty?
      where_clause += "EXISTS (SELECT FROM unnest(ingredients) ingredient WHERE 1=1 AND ( ingredient ILIKE '%#{ingredient}%' ))"
    end

    where(where_clause)
  end
end
