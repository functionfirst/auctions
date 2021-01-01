import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "confirmation", "confirmBtn", "totalBid" ]
  static values = { initial: Number, increment: Number, confirm: Boolean }

  incrementValueChanged () {
    const self = this

    this.totalBidTargets.forEach(function(item){
      item.innerHTML = self.totalBid
    })

    // if (!this.incrementValue) {
    //   this.confirmValue = false
    // }
  }

  confirmValueChanged () {
    // console.log('confirm vakue changed')
    // console.log(this.confirmValue)
    if (this.confirmValue) {
      this.show(this.confirmationTarget)
      this.hide(this.confirmBtnTargets)
    } else {
      this.hide(this.confirmationTarget)
      this.show(this.confirmBtnTargets)
    }
  }

  get totalBid () {
    const total = this.initialValue + this.incrementValue

    const options = {
      style: 'currency',
      minimumFractionDigits: 2,
      currencyDisplay: 'narrowSymbol',
      currency: 'GBP'
    }

    return new Intl.NumberFormat('en-GB', options).format(total)
  }

  setIncrement(e) {
    this.incrementValue = e.target.value
  }

  hide (target) {
    const targets = Array.isArray(target) ? target : [target]
    targets.forEach(function(item) {
      item.classList.add("hidden")
    })
  }

  show (target) {
    const targets = Array.isArray(target) ? target : [target]
    targets.forEach(function(item) {
      item.classList.remove("hidden")
    })
  }

  cancelBid () {
    this.confirmValue = false
  }

  confirmBid () {
    // console.log('confirm bid')
    // if (!this.incrementValue) return
    this.confirmValue = true
  }
}
