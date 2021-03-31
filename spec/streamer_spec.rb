require 'elevator_media/streamer.rb'
require 'rails_helper'

describe ElevatorMedia::Streamer do
    let!(:streamer){ElevatorMedia::Streamer.new}

    context 'Does getContent work?' do
        it 'it works' do
            expect(streamer).to respond_to(getContent)
        end
    end

end