const EventBus = {
  on (event, callback) {
    document.addEventListener(event, (e) => callback(e.detail))
  },

  emit (event, data) {
    document.dispatchEvent(new CustomEvent(event, { detail: data }))
  }
}

export default EventBus
