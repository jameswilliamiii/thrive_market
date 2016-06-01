ready = ->
  new Vivus 'cultivating_icon',
    file: '/images/cultivating.svg'
    type: 'scenario'
  new Vivus 'community_icon',
    duration: 100
    file: '/images/community_garden.svg'
    type: 'scenario'
  new Vivus 'healthy_icon',
    duration: 100
    file: '/images/healthy.svg'
    type: 'scenario'

$(document).ready(ready)
$(document).on('page:load', ready)
