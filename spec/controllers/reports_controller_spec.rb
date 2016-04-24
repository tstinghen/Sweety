require 'rails_helper' 

describe ReportsController do 



	describe 'GET #month' do 
	
		# it "extracts month from params" 
			# This error shows up when you 
			# are treating an array or string as a Hash.
			# In this line myHash.each do |item| you are
			# assigning item to a two-element array [key, value], 
			# so item[:symbol] throws an error.
		# it "prints the month name" do
			# get :month, :date.with({:month => 4})
			# expect(assigns(:month_name)).to eq('April') 
		# end	
			
		# it "populates an array of entries from the month" do
			# entry1 = FactoryGirl.create(:entry, date: "2016-04-03T03:45:15")
			# entry2 = FactoryGirl.create(:entry, date: "2016-03-03T03:45:15")
			# get :month, {:date[:month] => [3]}
			# expect(assigns(:entry_list)).to match_array([entry1])
		# end	
	end 
	
	describe 'GET #monthtodate' do 

			
		it "populates an array of entries from the current month" do
			entry1 = FactoryGirl.create(:entry, date: DateTime.now)
			entry2 = FactoryGirl.create(:entry, date: 35.days.seconds.ago )
			get :monthtodate 
			expect(assigns(:entry_list)).to include([entry1])
			expect(assigns(:entry_list)).to not_include([entry2])
		end	
	end 
	
	
		# it  "assigns a new Entry to be @entry" do
			# get :new	
			# expect(assigns(:entry)).to be_a_new(Entry)
			
		# end 
		
		# it "renders the new template" do 
			# get :new 
			# expect(response).to render_template :new 
		# end 
		
		# it "populates an array of entries from today" do 
			# entry1 = FactoryGirl.create(:entry, date: DateTime.now)
			# get :new 
			# expect(assigns(:daily_list)).to match_array([entry1])
			
		# end
		

		# it "populates a count of entries from today" do
			# entry1 = FactoryGirl.create(:entry, date: DateTime.now)
			# get :new 
			# expect(assigns(:daily_count)).to eq(1)
		# end

	


end 