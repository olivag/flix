removeErrorsBox = ->
  $('#list-errors-js').remove()
  $('#review_name').val ''
  $('#review_comment').val ''
  $('.star input').prop 'checked', false
  return

$(document).on "turbolinks:load", ->
  $("#write-review-link").click (event) ->
    event.preventDefault()
    removeErrorsBox()
    $("#review-form").fadeToggle()
    $('html, body').animate { scrollTop: $('#page-footer').offset().top }, 2000
    $("#review_name").focus()

  $("#review-cancel-button").click (event) ->
    event.preventDefault()
    removeErrorsBox()
    $("#review-form").fadeOut()


  $("#review-submit-btn").click ->
    $("#list-errors-js").remove()
    