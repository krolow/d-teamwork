mocha = require "mocha"
should = require "should"
Teamwork = require "#{__dirname}/../lib/teamwork"

describe "Teamwork", ->

  describe "constructor", ->
    it "should throw an Error if no URL is given", ->
      (-> new Teamwork).should.throw "You must pass the URL of teamwork"
    it "should throw an Error if no TOKEN is given", ->
      (-> new Teamwork "http://test.teamwork.com" ).should.throw "You must pass the Token to consume teamwork"
    it "should throw an Error if no PASSWORD is given", ->
      (-> new Teamwork "http://test.teamwork.com", "token").should.throw "You must pass the Password to consume teamwork"
    it "should set URL, TOKEN and PASSWORD properly", ->
      teamwork = new Teamwork "http://test.teamwork.com", "token", 'password'
      teamwork.url.should.be.equal "http://test.teamwork.com"
      teamwork.token.should.be.equal "token"
      teamwork.password.should.be.equal "password"
    it "should enable set a http client", ->
      request =
        test: true
      teamwork = new Teamwork 'url', 'token', 'password', request
      teamwork.request.should.be.equal request

  describe "methods available", ->
    teamwork = new Teamwork "http://test.teamwork.com", "token"

    methods = [
      'account',
      'authenticate',
      'lastActivities',
      'activity',
      'projects',
      'project',
      'taskLists',
      'taskList',
      'tasks',
      'task',
      'timeEntries',
      'timeEntry',
      'milestones',
      'milestone',
      'files',
      'file',
      'links',
      'link',
      'messages',
      'message',
      'comments',
      'companies',
      'company'
    ]

    methods.forEach (method) ->

      it "should have method #{method}", ->
        teamwork.should.have.property method
        #teamwork[method].should.be.a('function')

  describe "test url builder", ->
    teamwork = new Teamwork "http://test.teamwork.com", "token"

    it "should build projects url", ->
      teamwork.projects
      teamwork.build_url.should.be.equal 'http://test.teamwork.com/projects.json'
      teamwork.project(1).build_url.should.be.equal 'http://test.teamwork.com/projects/1.json'

    it "should build task lists url", ->
      teamwork.task_lists
      teamwork.project(1).build_url.should.be.equal 'http://test.teamwork.com/projects/1/task_lists.json'
