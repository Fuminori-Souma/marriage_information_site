import { Controller } from "@hotwired/stimulus"

// Thanks to: https://css-tricks.com/how-to-animate-the-details-element-using-waapi/

export default class extends Controller {
  static targets = ['summary', 'content']

  connect() {
    this.resetState()
  }

  resetState() {
    this.animation = null
    this.isClosing = false
    this.isExpanding = false
  }

  toggle(event) {
    event.preventDefault()

    this.element.style.overflow = 'hidden'

    if (this.isClosing || !this.element.open) {
      this.open()
    } else if (this.isExpanding || this.element.open) {
      this.shrink()
    }
  }

  open() {
    this.element.style.height = `${ this.element.offsetHeight }px`
    this.element.open = true

    window.requestAnimationFrame(() => this.expand())
  }

  expand() {
    this.isExpanding = true

    const startHeight = `${ this.element.offsetHeight }px`
    const endHeight = `${ this.summaryTarget.offsetHeight + this.contentTarget.offsetHeight }px`

    if (this.animation) {
      this.animation.cancel()
    }

    this.animation = this.animate(startHeight, endHeight)

    this.animation.onfinish = () => this.onAnimationFinish(true)
    this.animation.oncancel = () => this.isExpanding = false
  }

  shrink() {
    this.isClosing = true

    const startHeight = `${ this.element.offsetHeight }px`
    const endHeight = `${ this.summaryTarget.offsetHeight }px`

    if (this.animation) {
      this.animation.cancel()
    }

    this.animation = this.animate(startHeight, endHeight)

    this.animation.onfinish = () => this.onAnimationFinish(false)
    this.animation.oncancel = () => this.isClosing = false
  }

  animate(startHeight, endHeight) {
    return this.element.animate({
      height: [startHeight, endHeight]
    }, {
      duration: 300,
      easing: 'ease-out'
    })
  }

  onAnimationFinish(open) {
    this.element.open = open

    this.resetState()
    this.element.style.height = this.element.style.overflow = ''
  }
}