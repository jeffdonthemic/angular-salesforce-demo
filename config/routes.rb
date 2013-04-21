AngularSalesforceDemo::Application.routes.draw do
  resources :accounts
  root to: 'demo#index'
end
