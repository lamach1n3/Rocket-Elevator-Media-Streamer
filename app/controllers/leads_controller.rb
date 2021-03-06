class LeadsController < ApplicationController
    require 'sendgrid-ruby'
    
    def new
        @lead = Lead.new
    end
    
    def create
        puts (params) 
        file = lead_params[:file]
        @lead = Lead.new(lead_params.except(:file))
        if !file.nil?
            filedata = file.read
            
            @lead.file_attachment = filedata
            @lead.filename = file.original_filename
        end
        
        @lead.save!
        if @lead.save
            # fact_contacts()
            sendMail()
            redirect_to main_app.root_path, notice: "Message sent!"
        else    
            redirect_to "/leads", notice: "Invalid fields!"
        end
    end

    def sendMail
        puts("sendmail")
        email = @lead.email
        full_name = @lead.full_name
        project_name = @lead.project_name
        phone = @lead.phone
        # puts email
        # puts full_name
        # puts project_name
        # puts phone

        mail = SendGrid::Mail.new
        # puts mail
        mail.from = SendGrid::Email.new(email: "rocketelevatorswk7@gmail.com")
        # puts mail.from
        personalization = SendGrid::Personalization.new
        personalization.add_to(SendGrid::Email.new(email: email))
        personalization.add_dynamic_template_data({
            "full_name" => full_name,
            "project_name" => project_name,
            "phone" => phone
        })
        # puts personalization.add_dynamic_template_data

        mail.add_personalization(personalization)
        # puts mail.add_personalization
        mail.template_id = 'd-15d6bef02786488fa205bd75c1fa8f51'

        sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
        
        response = sg.client.mail._('send').post(request_body: mail.to_json)
    end

    private
    # def fact_contacts
    #   dwh = PG::Connection.new(host: 'codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com', port: 5432, dbname: "MaximeAuger_psql", user: "codeboxx", password: "Codeboxx1!")
    #   dwh.exec("TRUNCATE fact_contacts")

    #   dwh.prepare('to_fact_contacts', 'INSERT INTO fact_contacts (contact_id, creation_date, company_name, email, project_name, created_at, updated_at) VALUES ($1, $2, $3, $4, $5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)')
    #   Lead.all.each do |ldcontact|
    #   dwh.exec_prepared('to_fact_contacts', [ldcontact.id, ldcontact.created_at, ldcontact.company_name, ldcontact.email, ldcontact.project_name])
    #   end
    # end
    def lead_params
      params.require(:lead).permit(:full_name, :email, :phone, :company_name, :project_name, :department, :project_description,
      :message, :file_attachment, :file, :image)
    end
end
