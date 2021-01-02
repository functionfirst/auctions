const addClass = (item, cssName) => item.classList.add(cssName)

const removeClass = (item, cssName) => item.classList.remove(cssName)

const toggleClass = (item, cssName, add) => add ? addClass(item, cssName) : removeClass(item, cssName)

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

const toggle = (target, add) => {
  const targets = Array.isArray(target) ? target : [target]
  targets.forEach(function(item) {
    add ? addClass(item, 'hidden') : removeClass(item, 'hidden')
  })
}

export {
  addClass,
  removeClass,
  toggleClass,
  show,
  hide,
  toggle
}
