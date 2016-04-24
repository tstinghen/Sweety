require 'rails_helper'


feature 'record cbg results' do 

	scenario "add bad values" do 
		visit root_path 
		fill_in 'Enter CBG', with: '-100' 
		click_button 'Save Entry' 
		
		visit root_path 
		fill_in 'Enter CBG', with: 'testing' 
		click_button 'Save Entry' 
		
		visit root_path 
		fill_in 'Enter CBG', with: '123456' 
		click_button 'Save Entry' 
		
		visit root_path
		expect(page).to have_no_content "Today's CBG Results " 
		within 'body' do 
			expect(page).to have_no_content '-100'
			expect(page).to have_no_content 'testing'
			expect(page).to have_no_content '123456'
		end
	end
	
	
	scenario "add new results up to 4 times per day" do 
		visit root_path 
		fill_in 'Enter CBG', with: '100' 
		click_button 'Save Entry' 
		
		visit root_path
		expect(page).to have_content "Today's CBG Results " 
		within 'body' do 
			expect(page).to have_content '100'
		end
		
		visit root_path 
		fill_in 'Enter CBG', with: '101' 
		click_button 'Save Entry' 

		visit root_path 
		fill_in 'Enter CBG', with: '102' 
		click_button 'Save Entry' 
		
		visit root_path 
		fill_in 'Enter CBG', with: '103' 
		click_button 'Save Entry' 
		
		visit root_path
		expect(page).to have_content "Thank you! You have already entered your CBG results " 

	end 
end 