AAStudentApp::Application.routes.draw do
  resource :session, :only => [:new, :create, :destroy]
  resources :user
  resources :daily_reports
end
