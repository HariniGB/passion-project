# Require config/environment.rb
require_relative 'app/helpers/session_helper'
require ::File.expand_path('../config/environment',  __FILE__)

set :app_file, __FILE__

run Sinatra::Application
