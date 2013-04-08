updateCountdownString = (remaining) ->
  if remaining > 0
    $(".countdown").text remaining + ' ' +
                         owl.pluralize('character',remaining) + ' remaining.'
  else
    $(".countdown").text -remaining + ' ' +
                         owl.pluralize('character',remaining) + ' over limit.'

takeFromCollection = (collection, className) ->
  (collection.filter (attr) -> attr is className).toString()

updateCountdownAttributes = (remaining) ->
  toRemove = ["nearlimit", "almostlimit", "overlimit"]
  if remaining < 20
    toAdd = takeFromCollection(toRemove, "nearlimit")
  if remaining < 11
    toAdd = takeFromCollection(toRemove, "almostlimit")
  if remaining < 0
    toAdd = takeFromCollection(toRemove, "overlimit")

  if toAdd isnt null
    for attr in toRemove
      $(".countdown").removeClass attr
    $(".countdown").addClass toAdd
  if toAdd is "overlimit"
    $("input.btn.btn-large.btn-primary").attr("disabled", "true")
  else
    $("input.btn.btn-large.btn-primary").removeAttr("disabled")

updateCountdown = ->
  remaining = 140 - $("#micropost_content").val().length
  updateCountdownString(remaining)
  updateCountdownAttributes(remaining)

$(document).ready ->
  updateCountdown()
  $("#micropost_content").on("change keyup keydown keypress paste drop",
                             updateCountdown)