class Recipe < ApplicationRecord
  def self.search_by_ingredients ingredients
    return [] if ingredients.nil?

    ingredients = [ingredients] unless ingredients.is_a?(Array)

    select_clause = "*"
    where_clause = ""
    order_clause = ""
    ingredients.each.with_index do |ingredient, index|
      exists_clause = "EXISTS (SELECT FROM UNNEST(ingredients) ingredient WHERE ingredient ILIKE '%#{ingredient}%')"

      select_clause += ", CASE WHEN #{exists_clause} THEN 1 ELSE 0 END AS relevance_#{index}"

      where_clause += " OR " unless where_clause.empty?
      where_clause += exists_clause

      order_clause += ", " unless order_clause.empty?
      order_clause += "relevance_#{index} DESC"
    end

    select(select_clause).
      where(where_clause).
      order(Arel.sql(order_clause))
  end
end
