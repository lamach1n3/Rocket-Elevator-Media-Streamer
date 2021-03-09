require 'slack-ruby-client'
require 'date'

class Elevator < ApplicationRecord
    belongs_to :column ,optional: true
end
