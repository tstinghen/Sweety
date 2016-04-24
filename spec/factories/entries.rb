require 'faker' 

FactoryGirl.define do 
	factory :entry do |f|
		f.cbg {Faker::Number.between(10, 300) } 
		f.date { rand(35.days).seconds.ago }

	end
end 