const EventBus = {
  on (event, callback) {
    console.debug('listening on ', event)
    document.addEventListener(event, (e) => callback(e.detail))
  },

  emit (event, data) {
    console.debug('emitting ', event)
    document.dispatchEvent(new CustomEvent(event, { detail: data }))
  }
}

export default EventBus
