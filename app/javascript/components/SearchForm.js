import React from "react"
import PropTypes from "prop-types"

import EventBus from './EventBus'
import SearchFormInput from './SearchFormInput'

class SearchForm extends React.Component {
  constructor (props) {
    super(props)

    this.state = { ingredients: [''] }
    this.inputsContainerRef = React.createRef()
  }

  handleChange (event, index) {
    this.setState(
      {
        ingredients: Object.assign(
          [],
          this.state.ingredients,
          { [index]: event.target.value }
        )
      },
      () => EventBus.emit('searchApply', this.state)
    )
  }

  addInput () {
    this.setState({ ingredients: [...this.state.ingredients, ''] })
  }

  render () {
    const ingredientsInputs = this.state.ingredients.map((ingredient, index) => (
        <SearchFormInput
          key={`search-ingredient-input-${index}`}
          index={index}
          onChange={this.handleChange.bind(this)}
          value={ingredient} />
      ))

    return (
      <React.Fragment>
        <div ref={this.inputsContainerRef}>
          <label>Ingredients</label>
          {ingredientsInputs}
        </div>

        <button onClick={this.addInput.bind(this)}>Ajouter un ingrédient</button>
      </React.Fragment>
    );
  }
}

export default SearchForm
