class EntriesController < ApplicationController
#require 'active_support'


	def index 
	#keeping everything on the new page
		redirect_to :action => 'new' 
	end
	
	def show 
	#keeping everything on the new page
		redirect_to :action => 'new' 
	end
	  
	def new 
		@entry = Entry.new
		#determines how many CBG a user can submit per day, change for testing 
		#@max_daily = 400 #testing
		@max_daily = 4
		#generates a list of the daily results 
		@daily_list = Entry.where('date >= ?' , Date.yesterday.end_of_day)
		@daily_count = @daily_list.size

  

	end
	
	def create 
		@entry = Entry.new(entry_params)
		#every CBG result is time stamped when submitted, instead of manually
		@entry.date = DateTime.now
		@entry.save 
		redirect_to @entry
	end
	
	private
		def entry_params
			params.require(:entry).permit (:cbg)
		end 
	
end
