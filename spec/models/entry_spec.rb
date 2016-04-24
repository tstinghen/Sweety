require 'spec_helper'
require 'rails_helper'

describe Entry do

	it "has a valid factory" do
		FactoryGirl.create(:entry).should be_valid
	end
	it "is invalid without a cbg" do
		FactoryGirl.build(:entry, cbg: '').should_not be_valid
	end 
	it "is invalid without a date" do
		FactoryGirl.build(:entry, date: '').should_not be_valid
	end 
	
	it "is invalid without a date" do
		FactoryGirl.build(:entry, date: '').should_not be_valid
	end 
	it "has a cbg that is less than a thousand" do
		FactoryGirl.build(:entry, cbg: '1001').should_not be_valid
	end 
	
	it "has a cbg greater than zero" do
		FactoryGirl.build(:entry, cbg: '-123').should_not be_valid
	end
	
	it "has an integer as cbg" do
		FactoryGirl.build(:entry, cbg: 'abc').should_not be_valid
	end 

end
	