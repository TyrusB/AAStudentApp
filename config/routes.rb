AAStudentApp::Application.routes.draw do
  resource :session, :only => [:new, :create, :destroy]
  resources :users
  resources :daily_reports
end
