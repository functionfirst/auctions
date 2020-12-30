import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "confirmation", "required", "confirmBtn", "totalBid" ]
  static values = { initial: Number, increment: Number , confirm: Boolean }

  incrementValueChanged () {
    this.totalBidTarget.innerHTML = this.initialValue + this.incrementValue

    if (this.incrementValue) {
      this.hide(this.requiredTarget)
    } else {
      this.show(this.requiredTarget)
      this.confirmValue = false
    }
  }

  confirmValueChanged () {
    if (this.confirmValue) {
      this.show(this.confirmationTarget)
      this.hide(this.confirmBtnTarget)
    } else {
      this.hide(this.confirmationTarget)
      this.show(this.confirmBtnTarget)
    }
  }

  setIncrement(e) {
    this.incrementValue = e.target.value
  }

  hide (target) {
    target.classList.add("hidden")
  }

  show (target) {
    target.classList.remove("hidden")
  }

  cancelBid () {
    this.confirmValue = false
  }

  confirmBid () {
    if (!this.incrementValue) return
    this.confirmValue = true
  }
}
