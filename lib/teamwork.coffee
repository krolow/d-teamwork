ubuilder = require 'ubuilder'

class Teamworker

  constructor: (@url, @token, @password, @request) ->
    throw new Error "You must pass the URL of teamwork" unless @url?
    throw new Error "You must pass the Token to consume teamwork" unless @token?
    throw new Error "You must pass the Password to consume teamwork" unless @password?

    @request = require 'request' unless @request?

  account: ->
    ubuilder.add
      path: 'account'

    this

  authenticate: ->
    ubuilder.add
      path: 'authenticate',

    this

  activity: (id) ->
    throw new Error("It's necessary to specify the activity ID") unless id?

    ubuilder.add
      path: 'activity'
      id: id

    this

  lastActivities: ->
    ubuilder.add
      path: 'lastActivities',
      rules: [
        {need: 'project'}
      ]

    this

  messageCategories: (id) ->
    return @messageCategory id unless id

    ubuilder.add
      path: 'messageCategories'
      rules: [
        {need: 'project'},
        {need: 'project'},
      ]

    this

  messageCategory: (id) ->
    throw new Error("It's necessary to specify the messageCategory ID") unless id?

    ubuilder.add
      path: 'messageCategories'

    this

  fileCategories: (id) ->
    return @fileCategory id unless id

    ubuilder.add
      path: 'fileCategories'
      rules: [
        {method: 'post', need: 'project'},
        {method: 'get', need: 'project'},
      ]

    this

  fileCategory: (id) ->
    throw new Error("It's necessary to specify the fileCategory ID") unless id?

    ubuilder.add
      path: 'fileCategories'

    this

  linkCategories: (id) ->
    return @linkCategories id unless id

    ubuilder.add
      path: 'linkCategories'
      rules: [
        {method: 'post', need: 'project'},
        {method: 'get', need: 'project'},
      ]

    this

  linkCategory: (id) ->
    throw new Error("It's necessary to specify the linkCategory ID") unless id?

    ubuilder.add
      path: 'linkCategories'

    this

  projects: (id) ->
    return @project(id) unless id?

    ubuilder.add
      path: 'projects'

    this

  project: (id) ->
    ubuilder.add
      path: 'projects',
      id: id
    this

  taskLists: ->
    ubuilder.add
      path: 'task_lists'
    this

  taskList: (id) ->
    ubuilder.add
      path: 'task_list',
      id: id
    this

  tasks: (id) ->
    return @task(id) unless id?

    ubuilder.add
      path: 'tasks'
      rules: [
        {need: 'project'},
        {need: 'task_lists'},
      ]

    this

  task: (id) ->
    ubuilder.add
      path: 'task'
    this

  links: ->
    ubuilder.add
      path: 'links'
    this

  link: (id) ->
    ubuilder.add
      path: 'link'
    this

  timeEntries: ->
    ubuilder.add
      path: 'time_entries'
    this

  timeEntry: (id) ->
    ubuilder.add
      path: 'time_entry'
    this

  milestones: ->
    ubuilder.add
      path: 'milestones'
    this

  milestone: (id) ->
    ubuilder.add
      path: 'milestone',
      id: id
    this

  files: ->
    ubuilder.add
      path: 'files'
    this

  file: (id) ->
    ubuilder.add
      path: 'file'
      id: id
    this

  messages: ->
    ubuilder.add
      path: 'messages'
    this

  message: ->
    ubuilder.add
      path: 'message'
    this

  company: ->
    ubuilder.add
      path: 'company'
    this

  companies: ->
    ubuilder.add
      path: 'companies'
    this

  comments: ->
    ubuilder.add
      path: 'comments'
    this

  comment: ->
    ubuilder.add
      path: 'comments'
    this

  query: (params) ->
    ubuilder.query(params)

  post: ->
    Array.prototype.unshift.call arguments, "POST"
    @makeRequest.apply this, arguments
    this

  put: ->
    Array.prototype.unshift.call arguments, "PUT"
    @makeRequest.apply this, arguments
    this

  delete: ->
    Array.prototype.unshift.call arguments, "DELETE"
    @makeRequest.apply this, arguments
    this

  get: ->
    Array.prototype.unshift.call arguments, "GET"
    @makeRequest.apply this, arguments
    this

  makeRequest: (method, argsOrCallback, callback) ->
    options =
      method: method
      uri: @url + ubuilder.build()
      json: true
      auth:
        user: @token
        pass: @password

    callback = argsOrCallback if typeof argsOrCallback is 'function'

    @request(options, callback)


module.exports = Teamworker
