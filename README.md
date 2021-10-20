# STORIES

- [x] user can pick as many ingredients as he wishes
    - [x] user can add ingredients
    - [ ] user can remove ingredients
    - [ ] user can reset the search
- [x] update list of valid recipes as the user updates his list of ingredients
    - [x] recipes are displayed with their name
    - [ ] recipes are clickable
- [ ] user can see the details of a recipe

# TODO

- [x] implement models
- [x] implement import rake task
- [x] implement api endpoint to search recipes
- [x] implement basic form
- [x] implement search as-typing
- [x] display results

# IMPROVEMENT

- [ ] use jobs to update the DB (to prevent big, long cluttering tasks)
- [ ] build a list of ingredients (based on the ingredients mentioned in recipes)
    - [ ] import data from JSON to SQL (rake task)
    - [ ] extract ingredients into a dedicated table
    - [ ] extract recipes into a dedicated table and link ingredients
- [ ] normalize ingredients labels to ease the search and improve the relevance
    of results
    - dictionaries
    - synonyms
- [ ] enhance results
    - [ ] so it can differentiate `poire` from `poireau`
    - [ ] so it can manage `AND` and `OR` queries
