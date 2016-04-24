Rails.application.routes.draw do
  resources :entries
  
  get 'reports/month'
  get 'reports/date'
  get 'reports/monthtodate'
 
  root 'entries#new'


end
