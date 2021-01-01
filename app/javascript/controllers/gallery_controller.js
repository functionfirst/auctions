import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['carousel', 'indicator', 'image']
  static values = { currentSlide: Number }

  activated (entries) {
    return entries.reduce((max, entry) => (entry.intersectionRatio > max.intersectionRatio) ? entry : max)
  }

  observeSlides (entries) {
    const activated = this.activated(entries)

    if (activated.intersectionRatio > 0) {
      this.currentSlideValue = this.elementIndices[activated.target.getAttribute("id")]
      window.location.hash = `gallery-${this.currentSlideValue}`
      this.highlightIndicator()
    }
  }

  highlightIndicator () {
    for (let i = 0, len = this.indicatorTargets.length; i < len; i++) {
      const action = this.currentSlideValue === i ? 'add' : 'remove'
      this.indicatorTargets[i].classList[action]('bg-indigo-900')
    }
  }

  createObserver() {
    const options = {
      root: this.carouselTarget,
      threshold: 0.5
    }

    return new IntersectionObserver(entries => {
      this.observeSlides(entries)
    }, options)
  }

  initialize () {
    this.elementIndices = {}
    const observer = this.createObserver()

    for (let i = 0, len = this.imageTargets.length; i < len; i++) {
      const elementId = this.imageTargets[i].getAttribute('id')
      this.elementIndices[elementId] = i
      observer.observe(this.imageTargets[i])
    }
  }
}
