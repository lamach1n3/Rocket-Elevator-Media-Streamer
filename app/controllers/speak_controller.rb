class SpeakController < ApplicationController
require "ibm_watson/authenticators"
require "ibm_watson/text_to_speech_v1"
include IBMWatson
    
    def speech
        puts('test test!!!!!!!!!!!!!!!!')
        authenticator = Authenticators::IamAuthenticator.new(
             apikey: ''
        )
        puts("hello world")

        text_to_speech = TextToSpeechV1.new(
            authenticator: authenticator
        )

        text_to_speech.service_url = "https://api.us-east.text-to-speech.watson.cloud.ibm.com/instances/a9e170cf-7c55-4a4a-a204-b84b2d29a2fe"
        employee = Employee.find_by(user_id: current_user.id)
        File.open("#{Rails.root}/app/assets/audios/watson.mp3", "wb") do |audio_file|
            response = text_to_speech.synthesize(
                text: "Hello #{employee.first_name}",
                accept: "audio/mp3",
                voice: "en-GB_JamesV3Voice"
            ).result

        audio_file.write(response)
        puts("audio made")
        end

    end
   
end

