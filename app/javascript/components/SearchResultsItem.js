import React from "react"
import PropTypes from "prop-types"

class SearchResultsItem extends React.Component {
  render () {
    return (
      <React.Fragment>
        <p>
          {this.props.item.name}
        </p>
      </React.Fragment>
    );
  }
}

export default SearchResultsItem
