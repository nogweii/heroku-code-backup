#!/usr/bin/ruby

require 'bundler/setup'

require 'netrc'
u, p = Netrc.read['api.heroku.com']

require 'heroku-api'
herk = Heroku::API.new(username: u, password: p)
apps = herk.get_apps

apps.body.each do |app|
  puts "Heroku app #{app['name']} (access it at #{app['web_url']})"
  puts "    git clone #{app['git_url']}"
  puts
end
