require 'date'

class Elevator < ApplicationRecord
    belongs_to :column ,optional: true
    before_update :slack_message

    def slack_message
        timestamp = DateTime.now.strftime("%d-%m-%Y %H:%M")
        SlackNotifier::MESSAGE.ping "The Elevator #{self.id} with Serial Number #{self.serial_number} changed status from #{self.status_was} to #{self.status} at #{timestamp}."
    end
end
