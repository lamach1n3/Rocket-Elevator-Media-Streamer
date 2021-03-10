require 'date'  #gem use to format timestamp at the end of the message

class Elevator < ApplicationRecord
    belongs_to :column ,optional: true

    def twilio_sms

        if self.status == "intervention"
            account_sid = ENV["twilio_account_sid"]
            auth_token = ENV["twilio_auth_token"]
    
        @client = Twilio::REST::Client.new(account_sid, auth_token)
        message = @client.message.create(
            from: '+18124616988',
            body: "Bonjour,the elevator with serial number #{self.serial_number} changed its status to in intervention, please check.",
            to: '+15813094691',
        )
    
        puts 
        end 
    end
    before_update :slack_message

    def slack_message
      
        timestamp = DateTime.now.strftime("%d-%m-%Y %H:%M")         #to format timestamp at the end of the message
        SlackNotifier::MESSAGE.ping "The Elevator #{self.id} with Serial Number #{self.serial_number} changed status from #{self.status_was} to #{self.status} at #{timestamp}."    #message to Slack channel via Team-#4 app (WebHook)
    
    end
end

