import React from "react"
import PropTypes from "prop-types"

class SearchFormInput extends React.Component {
  render () {
    return (
      <input
        type="text"
        name="query[]"
        onChange={(e) => this.props.onChange(e, this.props.index)}
        value={this.props.value} />
    )
  }
}

SearchFormInput.propTypes = {
  onChange: PropTypes.func
}

export default SearchFormInput
