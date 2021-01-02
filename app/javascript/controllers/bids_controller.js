import { Controller } from "stimulus"
import { hide, show, addClass, removeClass, toggleClass, toggle } from "../lib/toggle"

const currencyOptions = {
  style: 'currency',
  minimumFractionDigits: 2,
  currencyDisplay: 'narrowSymbol',
  currency: 'GBP'
}

export default class extends Controller {
  static targets = [ 'confirmPanel', 'myBid', 'selectedBid', 'bidPanel', 'backdrop', 'formInput', 'setupPanel' ]
  static values = { initial: Number, increment: Number, confirm: Boolean, bidPanel: Boolean }

  initialize () {
    addClass(this.bidPanelTarget, 'translate-y-full')
  }

  bidPanelValueChanged () {
    toggleClass(this.bidPanelTarget, 'translate-y-full', !this.bidPanelValue)
    toggleClass(document.body, 'overflow-hidden', this.bidPanelValue)
    toggle(this.backdropTarget, !this.bidPanelValue)

    const action = this.bidPanelValue ? 'addEventListener' : 'removeEventListener'
    window[action]('keydown', this.escapeKeyPress.bind(this))

    if (!this.bidPanelValue) {
      this.confirmValue = false
    }
  }

  confirmValueChanged () {
    toggle(this.confirmPanelTarget, !this.confirmValue)
    toggle(this.setupPanelTarget, this.confirmValue)

    if (this.confirmValue) {
      this.formInputTarget.value = this.total
      this.myBidTarget.innerHTML = this.formattedTotal
    }
  }

  incrementValueChanged () {
    this.selectedBidTarget.innerHTML = this.formattedTotal
  }

  toggleBidPanel () {
    this.bidPanelValue = !this.bidPanelValue
  }

  escapeKeyPress(e) {
    e = e || window.event
    if (e.keyCode !== 27) return
    this.bidPanelValue = false
  }

  get total () {
    return this.initialValue + this.incrementValue
  }

  get formattedTotal () {
    return new Intl.NumberFormat('en-GB', currencyOptions).format(this.total)
  }

  setIncrement(e) {
    this.incrementValue = e.target.value
  }

  toggleConfirmPanel () {
    this.confirmValue = !this.confirmValue
  }
}
