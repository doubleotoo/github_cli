# encoding: utf-8

module GithubCLI
  class CLI < Thor
    include Thor::Actions
    require 'github_cli/subcommands'

    def initialize(*args)
      super
      the_shell = (options["no-color"] ? Thor::Shell::Basic.new : shell)
      GithubCLI.ui = UI.new(the_shell)
      GithubCLi.ui.debug! if options["verbose"]
      Terminal.print_program_name
    end

    map "repository" => :repo,
        "reference"  => :ref,
        "is" => :issue,
        "-v" => :version,
        "ls" => :list

    class_option :config, :type => :string,
                 :desc => "Configuration file.", :banner => "Config file name",
                 :default => ".githubrc"
    class_option :oauth, :type => :string, :aliases => '-a',
                 :desc => 'Authentication token.',
                 :banner => 'Set authentication token'
    class_option "no-color", :type => :boolean,
                 :banner => "Disable colorization in output."
    class_option :verbose, :type => :boolean,
                 :banner => "Enable verbose output mode."


    desc 'init', 'Generates a configuration file in your home directory'
    long_desc <<-DESC
      Initializes a configuration file where you can set default options for
      interacting with GitHub API. Both global and per-command options can be
      specified. These defaults override the bult-in defaults and allow you to
      omit commonly used command line options.
    DESC
    method_option :force, :type => :boolean, :default => false, :aliases => "-f",
                  :banner => "Overwrite configuration file. "
    def init(filename=nil)
      if filename.nil? || filename =~ /^\//
        @config_filename = options[:config]
      else
        @config_filename = filename
      end

      # config = Config.new(@config_filename)
      if File.exists?(GithubCLI.config.path) && !options[:force]
        GithubCLI.ui.error "Not overwritting existing config file #{GithubCLI.config.path}, use --force to override."
        exit 1
      end

      oauth_token = ask "Please specify your GitHub Authentication Token (register on github.com to get it):"
      GithubCLI.config.save({'oauth_token' => oauth_token, 'basic_auth' => nil })
      GithubCLI.ui.confirm "Writing new configuration file to #{GithubCLI.config.path}"
    end

    desc 'list <pattern>', 'List all available commands limited by pattern'
    def list(pattern="")
      pattern = /^#{pattern}.*$/i
      Terminal.print_commands pattern
    end

    desc 'version', 'Display Github CLI version.'
    def version
      say "Github CLI #{GithubCLI::VERSION}"
    end

  end # CLI
end # GithubCLI
