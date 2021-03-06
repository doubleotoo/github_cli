# encoding: utf-8

module GithubCLI
  class CLI

    desc "auth <command>", "Leverage Authorizations API"
    subcommand "auth", GithubCLI::Commands::Authorizations

    desc "blob <command>", "Leverage Blobs API"
    subcommand "blob", GithubCLI::Commands::Blobs

    desc "collab <command>", "Leverage Collaborators API"
    subcommand "collab", GithubCLI::Commands::Collaborators

    desc "commit <command>", "Leverage Commits API"
    subcommand "commit", GithubCLI::Commands::Commits

    desc "download <command>", "Leverage Downloads API"
    subcommand "download", GithubCLI::Commands::Downloads

    desc "fork <command>", "Leverage Forks API"
    subcommand "fork", GithubCLI::Commands::Forks

    desc "hook <command>", "Leverage Hooks API"
    subcommand "hook", GithubCLI::Commands::Hooks

    desc "issue <command>", "Leverage Issues API"
    subcommand "issue", GithubCLI::Commands::Issues

    desc "key <command>", "Leverage Keys API"
    subcommand "key", GithubCLI::Commands::Keys

    desc "label <command>", "Leverage Labels API"
    subcommand "label", GithubCLI::Commands::Labels

    desc "pull <command>", "Leverage Pull Requests API"
    subcommand "pull", GithubCLI::Commands::PullRequests

    desc "ref <command>", "Leverage References API"
    subcommand "ref", GithubCLI::Commands::References

    desc "repo <command>", "Leverage Repositories API"
    subcommand "repo", GithubCLI::Commands::Repositories

    desc "tag <command>", "Leverage Tags API"
    subcommand "tag", GithubCLI::Commands::Tags

    desc "tree <command>", "Leverage Trees API"
    subcommand "tree", GithubCLI::Commands::Trees

    desc "watch <command>", "Leverage Watching API"
    subcommand "watch", GithubCLI::Commands::Watching

  end # CLI
end # GithubCLI
