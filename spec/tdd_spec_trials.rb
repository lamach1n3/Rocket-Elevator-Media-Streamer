# so in the first exercise form remis video
#  1st we installed the  rspecs gem
#  then we added a new file called "string_calculator_spec.rb"
#  tried to run that file in the terminal usin the rspec command to prettify doc

#  bundle exec rspec --format documentation

# failed to run because there was no such file has string_calculator in the ./lib folder

# little added note try to keep "spec_helper.rb" has ligth has possible since in will always be loaded by default
# in the specs exec format

now i am going to add the "string_calculator.rb" file to ./lib
and run again 

#  bundle exec rspec --format documentation

this is the key of TDD everytime you add or change something to you run it again everytime
still am getting an error and this is caused by not having a defined class within its file
so no ill add class StringCalculator
              end
and run the bundle exec rspec again
at this point im getting any error message 0 examples and 0 failures processed


