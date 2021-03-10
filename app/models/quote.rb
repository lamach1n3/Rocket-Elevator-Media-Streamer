class Quote < ApplicationRecord

    after_save :new_zendesk_ticket_quote

    def new_zendesk_ticket_quote
        ZendeskAPI::Ticket.create!($client,
        :subject => "#{self.quotes_name} from #{self.quotes_company_name}",
        :comment => {
            :value => "The contact #{self.quotes_name} from #{self.quotes_company_name} can be reach at this email: #{self.quotes_email}.
            
            The building type selected for the quote is #{self.building_type} with the product line #{self.product_line}.
            The number of elevator suggested is #{self.number_of_elevators}, for a total price of #{self.total_price}.
            
            The Quote reference number is #{self.id}."
        },
        :requester =>{
            "Name": self.quotes_name,
            "Email": self.quotes_email
        },
        :priority => "normal",
        :type => "task"
        )
    end
end