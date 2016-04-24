require 'rails_helper'


feature 'run reports' do 

	scenario "month to date report runs and calculates stats" do
		visit root_path 
		fill_in 'Enter CBG', with: '100' 
		click_button 'Save Entry' 
		
		fill_in 'Enter CBG', with: '200' 
		click_button 'Save Entry' 
		
		click_button 'View Month to Date' 
		
		expect(page).to have_content "Daily CBG Results for the Month so Far" 
		expect(page).to have_content "Average: 150" 
		expect(page).to have_content "Maximum: 200" 
		expect(page).to have_content "Minimum: 100" 

	end
	
	scenario "monthly report runs and calculates stats" do 
		visit root_path 
		click_button 'Run Monthly Report' 

		expect(page).to have_content "Monthly CBG Results for " 
		expect(page).to have_content "Maximum: 0" 
		expect(page).to have_content "Minimum: 0" 

		click_link "Back" 
		
		fill_in 'Enter CBG', with: '125' 
		click_button 'Save Entry' 
		
		fill_in 'Enter CBG', with: '75' 
		click_button 'Save Entry' 
		
		click_button 'Run Monthly Report' 
		
		expect(page).to have_content "Monthly CBG Results for " 
		expect(page).to have_content "Average: 100" 
		expect(page).to have_content "Maximum: 125" 
		expect(page).to have_content "Minimum: 75" 

		click_link "Back" 
	
	end 
	
		scenario "daily report runs and calculates stats" do 
		visit root_path 
		click_button 'Run Daily Report' 

		expect(page).to have_content "Daily CBG Results for " 
		expect(page).to have_content "Maximum: 0" 
		expect(page).to have_content "Minimum: 0" 

		click_link "Back" 
		
		fill_in 'Enter CBG', with: '100' 
		click_button 'Save Entry' 
		
		fill_in 'Enter CBG', with: '150' 
		click_button 'Save Entry' 
		
		click_button 'Run Daily Report' 
		
		expect(page).to have_content "Daily CBG Results for " 
		expect(page).to have_content "Average: 125" 
		expect(page).to have_content "Maximum: 150" 
		expect(page).to have_content "Minimum: 125" 

		click_link "Back" 
	
	end 



end 