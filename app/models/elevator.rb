# require 'slack-ruby-client'
require 'date'

class Elevator < ApplicationRecord
    belongs_to :column ,optional: true
    before_update :slack_message

    def slack_message
        timestamp = DateTime.now.strftime("%d-%m-%Y %H:%M")
        e = Elevator.find(self.id)
        text = "The Elevator #{self.id} with Serial Number #{self.serial_number} changed status from #{self.status_was} to #{self.status} at #{timestamp}."
        Slack.configure do |config|
            config.token = ENV['SLACK_WEBHOOK']
        end
        client = Slack::Web::Client.new
        client.chat_postMessage(channel: '#elevator_operations', text: text, as_user: true)
    end
end
