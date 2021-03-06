# encoding: utf-8

module GithubCLI
  class Commands::Issues < Command

    namespace :issue

    method_option :params, :type => :hash
    desc 'list', 'Listing all issues'
    long_desc <<-TEXT
      ghc issue list --params filter:'assigned', state:'open'

       Parameters\n
         filter\n
          * assigned: Issues assigned to you (default) \n
          * created: Issues assigned to you (default) \n
          * mentioned: Issues assigned to you (default)\n
          * subscribed: Issues assigned to you (default)\n
        state - open, closed, default: open \n
        labels - String list of comma separated Label names. Example: bug,ui,@high
        sort - created, updated, comments, default: created \n
        direction - asc, desc, default: desc \n
        since - Optional string of a timestamp in ISO 8601 format: YYYY-MM-DDTHH:MM:SSZ \n
    TEXT
    def list
      say "listing #{options[:params]}"
    end

    desc 'get <user>,<repo>', 'Get a single issue'
    method_option :number, :type => :numeric, :required => true
    def get(user, repo)
      say "#{user}"
    end

    desc 'create <user>,<repo>', 'Create an issue.'
    method_option :params, :type => :hash
    def create(user, repo)
      say 'creating...'
    end

    desc 'edit <user>,<repo>', 'Edit an issue.'
    method_option :params, :type => :hash
    def edit(user, repo)
      say 'editing...'
    end

  end # Issues
end # GithubCLI
