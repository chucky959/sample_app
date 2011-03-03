require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Charles Wright",
         :email => "charles.wright@gmail.com",
         :password => "mets3113mets", :password_confirmation => "mets3113mets" )
   
    admin.toggle!(:admin)
    
    99.times do |n|
     name = Faker::Name.name
     email = "example-#{n+1}@railstutorial.org"
     password = "password"
     User.create!(:name => name, :email => email,
       :password => password, :password_confirmation => password)
   end
  end
end