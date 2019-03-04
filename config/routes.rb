Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#test"
  get "incidents", to: "welcome#index"
  get "latest_incidents", to: "welcome#incidentList"
  post "create_incident", to: "welcome#createIncident"
  get "filter_data", to: "welcome#filter"
end
