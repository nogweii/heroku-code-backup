#!/usr/bin/ruby

require 'bundler/setup'

require 'netrc'
u, p = Netrc.read['api.heroku.com']

require 'heroku-api'
herk = Heroku::API.new(username: u, password: p)
apps = herk.get_apps

unless File.directory? 'heroku'
  Dir.mkdir 'heroku'
end

# A log message wrapper
def log(msg)
  puts "\e[30;32m => \e[0m#{msg}"
end

# Take a Hash of app data, let's decide what to do with it
def mirror_mirror_on_the_wall(app)
  # Where to stick the clone
  git_dir = "heroku/#{app['name']}"

  if File.directory? git_dir
    # git clone exists already so we update it
    log "updating backup of #{app['name']}"
    system('git', *%W[--git-dir #{git_dir} remote update])
  else
    # directory doesn't exist! Make it
    log "creating git mirror of #{app['name']}"
    system('git', *%W[clone --mirror #{app['git_url']} #{git_dir}])
  end

  # And always update the description & git daemon export files
  open("#{git_dir}/description", 'w').puts "Heroku app #{app['name']} (access it at #{app['web_url']})"
  open("#{git_dir}/git-daemon-export-ok", 'w').print ''
end

apps.body.each do |app|
  mirror_mirror_on_the_wall app
end
