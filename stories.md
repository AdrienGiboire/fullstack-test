# STORIES

- [] display list of ingredients to the user
- [] user can pick as many ingredients as he wishes
    - [] user can add ingredients
    - [] user can remove ingredients
    - [] user can reset the search
- [] update list of valid recipes as the user updates his list of ingredients
    - [] recipes are displayed with their name
    - [] recipes are clickable
- [] user can see the details of a recipe

# IMPROVEMENT

- [] use jobs to update the DB
- [] build a list of ingredients (based on the ingredients mentioned in recipes)
    - [] import data from JSON to SQL (rake task)
    - [] extract ingredients into a dedicated table
    - [] extract recipes into a dedicated table and link ingredients
- [] normalize ingredients labels to ease the search and improve the relevance
    of results
    - dictionaries
    - synonyms
- [] enhance results 
    - [] so it can differentiate `poire` from `poireau`
    - [] so it can manage `AND` and `OR` queries
