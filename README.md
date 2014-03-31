# Backing up your Heroku code

This is useful if you already have you [code backed up from github][chrisd] and
want to back up your [Heroku](https://dashboard.heroku.com/apps) apps as well.

[chrisd]: https://chrisdown.name/2013/07/05/setting-up-local-github-mirror-with-cgit-git-daemon.html

### Install

Simple: `bundle install`.

It's assumed that you have authenticated using the [Heroku Toolbelt][toolbelt]
before using this script, and have a functioning `~/.netrc` file.

[toolbelt]: https://toolbelt.heroku.com/

### Usage

Usage is also simple. Just run the script: `ruby heroku_backup.rb`.

You probably want to put it on a cron job:

    20 22 * * * cd /srv/git/heroku_backup ; /usr/bin/ruby heroku_backup.rb >/dev/null 2>&1

This cron job assumes that the user the job executes as (varies, but it might be
`root` or `cron`) has a netrc file set up to authenticate with Heroku, per [the
toolbelt][toolbelt]
