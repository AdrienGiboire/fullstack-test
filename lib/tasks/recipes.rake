namespace :recipes do
  task import: :environment do
    File.foreach(File.join(Rails.root, "tmp/recipes.json")) do |data|
      import_id = Digest::SHA1.hexdigest data
      data = JSON.parse(data)

      Recipe.find_or_create_by(import_id: import_id) do |recipe|
        recipe.name = data["name"]
        recipe.people_quantity = data["people_quantity"]
        recipe.preparation_time = data["prep_time"]
        recipe.cooking_time = data["cook_time"]
        recipe.total_time = data["total_time"]
        recipe.image_url = data["image"]
        recipe.difficulty = data["difficulty"]
        recipe.ingredients = data["ingredients"]
      end
    end
  end
end
