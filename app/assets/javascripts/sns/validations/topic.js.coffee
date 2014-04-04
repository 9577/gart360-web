class @TopicValidator
  constructor: ->
    @new_topic()

  new_topic: ->
    $('.topic-form').validate
      rules:
        'topic[title]': { required: true }
        'topic[body]':  { required: true }
