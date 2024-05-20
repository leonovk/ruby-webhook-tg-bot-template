# frozen_string_literal: true

require 'telegram/bot'

class Bot
  TOKEN = 'your token'

  def initialize
    @client = Telegram::Bot::Client.new(TOKEN)
    request
  end

  private

  attr_reader :client

  def request
    update = Telegram::Bot::Types::Update.new(data)
    message = update.message

    return if message.nil?
    return if message.text.nil?

    chat_id = message.chat.id

    case message.text
    when '/start'
      client.api.send_message(chat_id:, text: 'hello world')
    end
  end
end
