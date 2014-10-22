class UrlBuilder

  constructor: ->
    @rules = []

  @add: (params) ->
    @rules.push params

  @clean: ->
    @rules = []

  @build: ->
    @rules.forEach (rule) ->
      console.log rule