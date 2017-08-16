# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

cycleImages = (container) ->
  $active = container.find('.active')
  $next = if $active.next().length > 0 then $active.next() else container.find('img:first')
  $next.css 'z-index', 2
  #move the next image up the pile
  $active.fadeOut 1500, ->
#fade out the top image
    $active.css('z-index', 1).show().removeClass 'active'
    #reset the z-index and unhide the image
    $next.css('z-index', 3).addClass 'active'
    #make the next image the top one
    return
  return

$(document).ready ->
  setInterval (->
    cycleImages $('#cycler1')
    return
  ), 2000
  setInterval (->
    cycleImages $('#cycler2')
    return
  ), 3000
  return

$ ->
  $("a[#follow]").on "ajax:success", (e, data, status, xhr) ->
  alert "The article was deleted."