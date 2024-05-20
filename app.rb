# frozen_string_literal: true

require 'sinatra'
require_relative 'lib/bot'

# main app class
class Application < Sinatra::Base
  post '/bot' do
    Bot.new(JSON.parse(request.body.read))
  end
end
