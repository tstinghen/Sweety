class ReportsController < ApplicationController

def month

	@select_month = sprintf('%02d', params[:date][:month]) 
	@what_is_date = params[:date] #testing 
	@month_name = Date::MONTHNAMES[@select_month.to_f]
	@entry_list = Entry.where("strftime('%m', date) = ?", @select_month)	
		entry_stats(@entry_list) 


end 

def monthtodate 
	@select_month = Time.now
	@entry_list = Entry.where("strftime('%m', date) = ?", Time.now.strftime("%m"))	
		entry_stats(@entry_list) 
end 


def date 
	@select_date = sprintf('%02d', params[:date][:month]) + '/'+ sprintf('%02d', params[:date][:day]) + '/'+ sprintf('%02d', params[:date][:year])
	@entry_list = Entry.where("strftime ('%m/%d/%Y', date) = ?", @select_date)	
	entry_stats(@entry_list) 


end 

def entry_stats(entry_list) 
		if entry_list.size > 0 
		
			@entry_vals = entry_list.map {|entry| entry.cbg}
			@avg = @entry_vals.sum / @entry_vals.size
			@minmax = @entry_vals.minmax
		else 
			@minmax = [0, 0] 
		end
	
end 



end
