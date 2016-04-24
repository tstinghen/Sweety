class EntriesController < ApplicationController
#require 'active_support'


	def index 
		redirect_to :action => 'new' 
	end
	
	def show 
		redirect_to :action => 'new' 
	end
	  
	def new 
		@entry = Entry.new
		#@max_daily = 400 #testing
		@max_daily = 4
		@daily_list = Entry.where('date >= ?' , Date.yesterday.end_of_day)
		@daily_count = @daily_list.size

  

	end
	
	def create 
		@entry = Entry.new(entry_params)
		@entry.date = DateTime.now
		@entry.save 
		redirect_to @entry
	end
	
	private
		def entry_params
			params.require(:entry).permit (:cbg)
		end 
	
end
