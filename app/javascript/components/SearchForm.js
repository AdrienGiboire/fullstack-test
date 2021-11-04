import React from "react"
import PropTypes from "prop-types"

import EventBus from './EventBus'
import SearchFormInput from './SearchFormInput'

class SearchForm extends React.Component {
  constructor (props) {
    super(props)

    this.state = { ingredients: [''] }
    this.inputsContainerRef = React.createRef()
    this.delayFunction = null
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
      () => {
        this.delayFunction && clearTimeout(this.delayFunction)
        this.delayFunction = setTimeout(() => {
          EventBus.emit('searchApply', this.state)
        }, 500)
      }
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
