ready = ->
  @cultivating = new Vivus 'cultivating_icon',
    duration: 200
    file: '/images/cultivating.svg'
    type: 'oneByOne'
    pathTimingFunction: Vivus.EASE_IN
  new Vivus 'community_icon',
    duration: 200
    file: '/images/community_garden.svg'
    type: 'oneByOne'
    pathTimingFunction: Vivus.EASE_IN
  new Vivus 'healthy_icon',
    duration: 100
    file: '/images/healthy.svg'
    type: 'oneByOne'
    pathTimingFunction: Vivus.EASE_IN

$(document).ready(ready)
$(document).on('page:load', ready)