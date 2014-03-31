# Backing up your heroku code

This is useful if you already have you [code backed up from github][chrisd] and
want to back up your heroku projects as well.

[chrisd]: https://chrisdown.name/2013/07/05/setting-up-local-github-mirror-with-cgit-git-daemon.html

### Install

Simple: `bundle install`.

It's assumed that you have authenticated using the [Heroku Toolbelt][toolbelt]
before using this script, and have a functioning `~/.netrc` file.

[toolbelt]: https://toolbelt.heroku.com/

### Usage

Usage is also simple. Just run the script: `ruby heroku_list.rb`
