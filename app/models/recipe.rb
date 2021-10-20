class Recipe < ApplicationRecord
  def self.search_by_ingredients ingredients
    ingredients = [ingredients] unless ingredients.is_a?(Array)

    sub_where_clause = ""
    ingredients.each do |ingredient|
      sub_where_clause += if sub_where_clause.empty? then
                        "ingredient ILIKE '%#{ingredient}%'"
                      else
                        "OR ingredient ILIKE '%#{ingredient}%'"
                      end
    end
    where_clause = "EXISTS (SELECT FROM unnest(ingredients) ingredient WHERE 1=1 AND ( #{sub_where_clause} ))"

    where(where_clause)
  end
end
