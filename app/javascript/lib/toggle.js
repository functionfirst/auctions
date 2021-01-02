const addClass = (item, cssName) => item.classList.add(cssName)

const removeClass = (item, cssName) => item.classList.remove(cssName)

const show = target => {
  const targets = Array.isArray(target) ? target : [target]
  targets.forEach(function(item) {
    removeClass(item, 'hidden')
  })
}

const hide = target => {
  const targets = Array.isArray(target) ? target : [target]
  targets.forEach(function(item) {
    addClass(item, 'hidden')
  })
}

export {
  addClass,
  removeClass,
  show,
  hide,
}
