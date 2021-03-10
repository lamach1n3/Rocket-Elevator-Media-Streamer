class Lead < ApplicationRecord

    after_save :new_zendesk_ticket_lead

    def new_zendesk_ticket_lead
        ZendeskAPI::Ticket.create!(client,
        :subject => "#{self.full_name} from #{self.company_name}",
        :comment => {
            :value => "The contact #{self.full_name} from #{self.company_name} can be reach at email #{self.quotes_email}
            and at phone number #{self.phone}.
            #{self.department} has a project named #{self.project_name} which would require contribution from Rocket Elevators.

            #{self.project_description}

            Attached Message: #{self.message}

            The Contact uploaded an attachment"
        },
        :requester =>{
            "Name": self.full_name,
            "Email": self.quotes_email
        },
        :priority => "normal",
        :type => "question"
        )
    end

end