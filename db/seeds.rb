# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

AdsType.create(:name =>'default')
AdsType.create(:name =>'smth important')
User.create(:email => 'try@example.by', :name => 'admin', :password => '12345678', :role => 'admin')
User.create(:email => 'sss@sss.sss', :name => 'snake', :password => 'ssssssss', :role => 'user')
