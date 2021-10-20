import React from "react"
import PropTypes from "prop-types"

import EventBus from './EventBus'
import SearchForm from './SearchForm'
import SearchResults from './SearchResults'

class App extends React.Component {
  constructor (props) {
    super(props)
    this.state = { results: [] }


  }

  render () {
    return (
      <React.Fragment>
        <SearchForm />
        <SearchResults results={this.state.results} />
      </React.Fragment>
    );
  }
}

export default App
