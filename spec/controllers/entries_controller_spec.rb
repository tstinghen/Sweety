require 'rails_helper' 

describe EntriesController do 

	describe 'GET #index' do 

		it "redirects to new" do 
			get :index
			expect(response).to redirect_to :action => :new 
		end
	end
	
	# describe 'GET #show' do
		# it "redirects to new" do 
			# get :show
			# expect(response).to redirect_to :action => :new 
		# end
	
	# end

	describe 'GET #new' do 
		it  "assigns a new Entry to be @entry" do
			get :new	
			expect(assigns(:entry)).to be_a_new(Entry)
			
		end 
		
		it "renders the new template" do 
			get :new 
			expect(response).to render_template :new 
		end 
		
		it "populates an array of entries from today" do 
			entry1 = FactoryGirl.create(:entry, date: DateTime.now)
			get :new 
			expect(assigns(:daily_list)).to match_array([entry1])
			
		end
		

		it "populates a count of entries from today" do
			entry1 = FactoryGirl.create(:entry, date: DateTime.now)
			get :new 
			expect(assigns(:daily_count)).to eq(1)
		end

	end 


end 