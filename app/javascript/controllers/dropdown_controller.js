import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'menu' ]
  static values = { open: Boolean }

  initialize () {
    this.isInside = false
    this.element.addEventListener('mouseenter', this.mouseOver.bind(this))
    this.element.addEventListener('mouseleave', this.mouseOut.bind(this))
  }

  mouseOver () {
    this.isInside = true
  }

  mouseOut () {
    this.isInside = false
  }

  openValueChanged () {
    if (this.openValue) {
      this.menuTarget.classList.remove('hidden')
      window.addEventListener('keydown', this.escapeKeyPress.bind(this))
      window.addEventListener('click', this.closeMenu.bind(this))
    } else {
      this.menuTarget.classList.add('hidden')
      window.removeEventListener('keydown', this.escapeKeyPress.bind(this))
      window.removeEventListener('click', this.closeMenu.bind(this))
    }
  }

  closeMenu () {
    if (this.isInside) return
    this.openValue = false
  }

  escapeKeyPress(e) {
    e = e || window.event
    if (e.keyCode !== 27) return
    this.openValue = false
  }

  toggle () {
    this.openValue = !this.openValue
  }

  close () {
    this.openValue = false
  }
}
