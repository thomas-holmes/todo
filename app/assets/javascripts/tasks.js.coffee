# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$('a.task').on 'click', (e) ->
  e.preventDefault
  parent = $(this).parent()
  $(this).remove()
  children = parent.children()
  if parent.children().length == 0
    $("div.#{parent.attr 'class'}").hide()
