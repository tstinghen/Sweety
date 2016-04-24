class ReportsController < ApplicationController

def month
	#parses results from the select_month selector
	@select_month = sprintf('%02d', params[:date][:month]) 
	@month_name = Date::MONTHNAMES[@select_month.to_f]
	#text matching to filter for month. 
	#would be easy enough to put a year selector and match for that as well
	@entry_list = Entry.where("strftime('%m', date) = ?", @select_month)	
		entry_stats(@entry_list) 


end 

def monthtodate 
	@select_month = Time.now
	#text matching for month (could be converted to month/year) 
	@entry_list = Entry.where("strftime('%m', date) = ?", Time.now.strftime("%m"))	
		entry_stats(@entry_list) 
end 


def date 
	#parses date from date_selector
	@select_date = sprintf('%02d', params[:date][:month]) + '/'+ sprintf('%02d', params[:date][:day]) + '/'+ sprintf('%02d', params[:date][:year])
	#text matching for entire date
	@entry_list = Entry.where("strftime ('%m/%d/%Y', date) = ?", @select_date)	
	entry_stats(@entry_list) 


end 

def entry_stats(entry_list) 
		#creates stats out of a populated array, or just sets min/max to 0 
		if entry_list.size > 0 
		
			@entry_vals = entry_list.map {|entry| entry.cbg}
			@avg = @entry_vals.sum / @entry_vals.size
			@minmax = @entry_vals.minmax
		else 
			@minmax = [0, 0] 
		end
	
end 



end
