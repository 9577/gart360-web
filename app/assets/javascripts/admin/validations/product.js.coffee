class @ProductValidator
  constructor: ->
    @new_product()

  new_product: ->
    $('.product-form').validate
      rules:
        'product[title]':           { required: true }
