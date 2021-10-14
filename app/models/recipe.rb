class Recipe < ApplicationRecord
  def self.search_by_ingredient ingredient
    where("EXISTS (SELECT FROM unnest(ingredients) ingredient WHERE ingredient LIKE '%#{ingredient}%')")
  end
end
