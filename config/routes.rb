AAStudentApp::Application.routes.draw do
  root to: 'static_pages#home'

  resource :session, :only => [:new, :create, :destroy]


  resources :assessments do
    resources :submissions, :only => [:show] do
      resources :annotations, :only => [:create]
      resources :comments, :only => [:create]
    end
  end
  resources :users
  resources :daily_reports
  resources :report_comments, :only => [:create, :destroy]


end
