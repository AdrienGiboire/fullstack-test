import React from "react"
import PropTypes from "prop-types"
import axios from 'axios'

import EventBus from './EventBus'
import SearchResultsItem from './SearchResultsItem'

let source

class SearchResults extends React.Component {
  constructor (props) {
    super(props)

    this.state = { results: [] }
    source = axios.CancelToken.source()
  }

  componentDidMount () {
    EventBus.on('searchApply', (data) => this.handleNewSearch(data))
  }

  componentWillUpdate () {
    source && source.cancel('Canceling previous requests.')
    source = axios.CancelToken.source()
  }

  handleNewSearch (data) {
    axios.get('/api/recipes/search', {
      cancelToken: source.token,
      params: { query: data.ingredients }
    }).then((response) =>
      this.setState({ results: response.data })
    )
  }

  render () {
    const items = this.state.results.map((item) => <SearchResultsItem item={item} />)

    return (
      <React.Fragment>
        <h2>{this.state.results.length} Recipes</h2>
        {items}
      </React.Fragment>
    );
  }
}

export default SearchResults
