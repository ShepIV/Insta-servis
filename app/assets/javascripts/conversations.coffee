# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = undefined

ready = ->
# enable chosen js
  $('.chosen-select').chosen no_results_text: 'No results matched'
  return

$(document).ready ready
# if using turbolinks
$(document).on 'page:load', ready