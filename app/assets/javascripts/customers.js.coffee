# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  customer.setupForm()

customer =
  setupForm: ->
    $('#new_customer').submit -> 
      $('input[type=submit]').attr('disabled', true)
      if $('#card_number').length 
        customer.processCard()
        false
      else
        true

  processCard: ->
    card =
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(card, customer.handleStripeResponse)

  handleStripeResponse: (status, response) ->
    if status == 200
      $('#customer_stripe_card_token').val(response.id)
      $('#new_customer')[0].submit() 
    else
      $('#stripe_error').text(I18n["customer"]["card"]["update"][response.error.code]).addClass('alert alert-danger card-error')
      $('input[type=submit]').attr('disabled', false)

