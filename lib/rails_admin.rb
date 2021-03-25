require "ibm_watson/authenticators"
require "ibm_watson/text_to_speech_v1"
include IBMWatson


module RailsAdmin
    module Config
        module Actions
            class IMB < RailsAdmin::Config::Actions::Base
            RailsAdmin::Config::Actions.register(self)
            
                

                register_instance_option :root? do
                    true
                end

                register_instance_option :breadcrumb_parent do
                    nil
                end

        
                register_instance_option :controller do
                    proc do
                        puts('test test!!!!!!!!!!!!!!!!')
                        # authenticator = Authenticators::IamAuthenticator.new(
                        #     api_key: ENV['IBM_apikey']
                        # )

                        # text_to_speech = TextToSpeechV1.new(
                        #     authenticator: authenticator
                        # )

                        # text_to_speech.service_url = "https://api.us-east.text-to-speech.watson.cloud.ibm.com/instances/73971b94-3984-43a8-bc26-99bcb32ddd57"
                        # employee = Employee.find_by(user_id: current_user.id)
                        # File.open("public/watson.wav", "wb") do |audio_file|
                        #     response = text_to_speech.synthesize(
                        #         text: "test test",
                        #         accept: "audio/mp3",
                        #         voice: "en-GB_JamesV3Voice"
                        #     ).result

                        # audio_file.write(response)
                        # puts("audio made")
                        # end
                        # render @action.template_name, status: 200 
                    end     
                
                end
                

                register_instance_option :route_fragment do
                    ''
                end

                register_instance_option :link_icon do
                    'icon-home'
                end

                register_instance_option :statistics? do
                    true
                end

            end

        end
      end
    end
end
# is this going to create a pull request


