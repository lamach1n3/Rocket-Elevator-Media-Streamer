# Rocket Elevators Information System <img src="app/assets/images/favicon.png" align="right" alt="Rocket Elevators logo by Maxime Auger" width="100" height="">

# Week 7
#  Life is a Web Service
If more informations is needed on database and basic operation of our Web App please refer to Week 4 and Week 5's Readme at https://github.com/officialmxm/Rocket_Elevators_Information_System




 - 📚 Instructions to acces to the admin panel:


To log as Admin:
```
1. click the log in the nav bar
2. Username:admin@admin.com
3. password: 123456
4. click on the admin button in nav bar
```
![](app/assets/images/readme/login.png)









This week we are implementing API's to our web app. Here are the API's weve implemented this week. We also started working ENVIRONEMENTS using the gem FIGARO and the application.yml file.

- Google Maps
- Twilio
- Slack
- Dropbox
- Sendgrid
- IBM Watson
- Zendesk

Also we will show you the following updates
- Gems added
- API's
- Routes
- URL for our site https://claudestlaurent.xyz
- week 7 video link https://youtu.be/9A7IXR1kIfo
- Team



### 1 - Gems Added this week <img src="https://w7.pngwing.com/pngs/96/713/png-transparent-ruby-on-rails-programming-language-rubygems-php-ruby-gem-angle-heart-logo.png" align="right" alt="Rocket Elevators logo by Maxime Auger" width="70" height="">
* gem 'devise'
      https://github.com/heartcombo/devise

* gem 'rails-admin'
      https://github.com/sferik/rails_admin/

# Rocket Elevators Information System <img src="app/assets/images/favicon.png" align="right" alt="Rocket Elevators logo by Maxime Auger" width="100" height="">
# Week 5


During this week, participants are exposed to a more elaborate data model and must perform basic query exercises. They will be asked to create tables, alter them and extend the concepts managed by their information system.
Two types of databases will be requested for this exercise
A relational database
A data warehouse for decision-making

1. create a link to the postgresql database
2. tables added in mysql
- address
- leads
- customers
- buildings
- building_details
- batteries
- columns
- elevators
![](app/assets/images/readme/week5_mysql_diagram.png)

3. postgresql is going to be our data warehouse for decision-making



- to connect to your postgresql DB you nees to start it with this command line: 
**sudo service postgresql start/stop/status**# Rocket Elevators Information System <img src="app/assets/images/favicon.png" align="right" alt="Rocket Elevators logo by Maxime Auger" width="100" height="">

# Week 7
#  Life is a Web Service
If more informations is needed on database and basic operation of our Web App please refer to Week 4 and Week 5's Readme at https://github.com/officialmxm/Rocket_Elevators_Information_System




 - 📚 Instructions to acces to the admin panel:


To log as Admin:
```
1. click the log in the nav bar
2. Username:admin@admin.com
3. password: 123456
4. click on the admin button in nav bar
```
![](app/assets/images/readme/login.png)









This week we are implementing API's to our web app. Here are the API's weve implemented this week. We also started working ENVIRONEMENTS using the gem FIGARO and the application.yml file.

- Google Maps
- Twilio
- Slack
- Dropbox
- Sendgrid
- IBM Watson
- Zendesk

Also we will show you the following updates
- Gems added
- API's
- Routes
- URL for our site https://claudestlaurent.xyz
- week 7 video link https://youtu.be/9A7IXR1kIfo
- Team



### 1 - Gems Added this week <img src="https://w7.pngwing.com/pngs/96/713/png-transparent-ruby-on-rails-programming-language-rubygems-php-ruby-gem-angle-heart-logo.png" align="right" alt="Rocket Elevators logo by Maxime Auger" width="70" height="">
* gem 'devise'
      https://github.com/heartcombo/devise

* gem 'rails-admin'
      https://github.com/sferik/rails_admin/

* gem 'devise'
      https://github.com/heartcombo/devise

* gem 'rails-admin'
      https://github.com/sferik/rails_admin/

* gem 'devise'
      https://github.com/heartcombo/devise

* gem 'rails-admin'
      https://github.com/sferik/rails_admin/


### 2 - Google Map

With our google account we log int the console.cloud.google where we ll set a google API key and enables service that we will need , copy the key and save it.



read me created by jean-francois taillefer





















![](app/assets/images/readme/postgresql.png)

4.  also to  create and migrate tables its very similar to mysql except you add  DB=nameOfDatabase: 

- **DB=dwh rails db:create**
- **DB=dwh rails db:migrate**

5. the tables created for postgres
- FactQuotes
- FactContact
- FactElevator
- DimCustomers

![](app/assets/images/readme/week5_postgresql_diagram.png)

6. updated Admin section with charts and new tables mysql and postgresql
![](app/assets/images/readme/wk5updadmin.png)
7. Rake tasks

  Rake tasks are custom build executable files that we are using to populate the postgresql database (Dwh) from our seeded data and submit data from web pages (quotes and contact us forms). Within theses task we establish a connection to our mysql DB and postgres DB, 
  
 

      (actual data to  connect is in the rake file not the read me)
This is an example of a rake task

  ``` Ruby
  desc "Import data from Quote Table to Fact Quote Table"
  task quotes: :environment do
    dwh = PG::Connection.new(host: 'localhost', port: port, dbname: "dbname", user: "user", password: "password")
    puts "lead table to fact_quote table"
    
    dwh.exec("TRUNCATE fact_quotes")

    dwh.prepare('to_fact_quotes', 'INSERT INTO fact_quotes (quote_id, creation, company_name, email, nb_elevator, created_at, updated_at) VALUES ($1, $2, $3, $4, $5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)')
    Quote.all.each do |quotes|
      dwh.exec_prepared('to_fact_quotes', [quotes.id, quotes.created_at, quotes.quotes_company_name, quotes.quotes_email, quotes.elevator_amount])
    end
  end 
  ```

8. File attachement in the contact us form was also added and supports all types of files. the filename can be seen in the admin section of the leads table and in the database.

9. Charts were added in the admin panel through chartskick
10. updated routes week 5

![](app/assets/images/readme/week5routes.png)

* gem 'rails-admin'
      https://github.com/sferik/rails_admin/

* gem 'devise'
      https://github.com/heartcombo/devise

* gem 'rails-admin'
      https://github.com/sferik/rails_admin/


### 2 - Google Map

With our google account we log int the console.cloud.google where we ll set a google API key and enables service that we will need , copy the key and save it.



read me created by jean-francois taillefer


















