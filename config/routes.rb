AAStudentApp::Application.routes.draw do
  root to: 'static_pages#home'

  resource :session, :only => [:new, :create, :destroy]
  resources :users do
    resources :daily_reports, :only => [:index]
  end
  resources :daily_reports, :except => [:index]

  resources :assessments do
    resources :submissions, :only => [:show]
  end

end
