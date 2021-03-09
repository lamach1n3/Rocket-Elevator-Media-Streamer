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
end

