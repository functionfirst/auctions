import { Controller } from "stimulus"
import { show, hide, addClass, removeClass } from '../lib/toggle'

export default class extends Controller {
  static targets = [ 'text', 'show', 'hide' ]

  /**
   * Display the show button and add truncation since JS is supported
   * With JS support offer we don't truncate the text and hide the more info button by default
   */
  initialize () {
    show(this.showTarget)
    addClass(this.textTarget, 'truncate')
  }

  /**
   * Clicking the show less button should re-apply truncation and display the more info button
   */
  hideText () {
    hide(this.hideTarget)
    show(this.showTarget)
    addClass(this.textTarget, 'truncate')
  }

  /**
   * Clickig the more info button should remove truncation and display the show less button.
   */
  showText () {
    show(this.hideTarget)
    hide(this.showTarget)
    removeClass(this.textTarget, 'truncate')
  }
}
