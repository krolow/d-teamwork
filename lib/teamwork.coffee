UrlBuilder = require "./url_builder"

class Teamworker

  constructor: (@url, @token, @request) ->
    @urlBuilder = new UrlBuilder

    throw new Error "You must pass the URL of teamwork" unless @url?
    throw new Error "You must pass the Token to consume teamwork" unless @token?

    @request = require 'request' unless @request?

  projects: (id) ->
    return @project(id) unless id?

    @addAction 'projects'
    this

  project: (id) ->
    @addAction 
      path: 'project',
      params: id
      methods: ['get', 'post', 'put', 'delete']
    this

  account: ->
    @urlBuilder.add "account"
    this

  authenticate: ->
    @addAction "authenticate"
    this

  activity: ->
    @addAction "activity"
    this

  lastActivities: ->
    @addAction.add
      path: 'lastActivities',
      mayContain: [{method: 'get', path: 'project'}]
    this

  taskLists: ->
    @addAction 'task_lists'
    this

  taskList: (id) ->
    @addAction 'task_list', id
    this

  tasks: (id) ->
    return @task(id) unless id?
    
    @urlBuilder.add
      path: 'tasks'
      mayContain: [
        {method: 'get', 'project'},
        {method: 'get', 'project'},
      ]

    this

  task: (id) ->
    @addAction 'task'
    this

  links: ->
    @addAction 'links'
    this

  link: (id) ->
    @addAction 'link'
    this

  timeEntries: ->
    @addAction 'time_entries'
    this

  timeEntry: (id) ->
    @addAction 'time_entry'
    this

  milestones: ->
    @addAction 'milestones'
    this

  milestone: (id) ->
    @addAction 'milestone', id
    this

  files: ->
    @addAction 'files'
    this

  file: ->
    @addAction 'file'
    this

  messages: ->
    @addAction 'messages'
    this

  message: ->
    @addAction 'message'
    this

  company: ->
    @addAction 'company'
    this

  companies: ->
    @addAction 'companies'
    this

  comments: ->
    @addAction 'comments'
    this

  comment: ->
    @addAction 'comments'
    this

  addAction: (path, params) ->
    id = {} unless id?
    @actions.push({path: path, params: params})

  query: (params) ->
    @urlBuilder.query(params)

  post: ->
    makeRequest arguments
    this

  put: ->
    makeRequest arguments
    this

  delete: ->
    makeRequest arguments
    this

  get: ->
    makeRequest arguments
    this

  makeRequest: ->
    arguments.unshift makeRequest.caller.name
    console.log arguments
    url = @build_url(@actions)


module.exports = Teamworker