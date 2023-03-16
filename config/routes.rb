Rails.application.routes.draw do
  devise_for :employees, controllers: {
        sessions: 'employees/sessions'
      }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "employees#home"
  resources :employees
  resources :departments
  resources :leaves
end
