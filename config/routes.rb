Rails.application.routes.draw do
  devise_for :users, skip: :registrations, controllers: {
                       sessions: "users/sessions",
                       passwords: "users/passwords",
                     }

  root "home#index"

  devise_scope :user do
    get "users/edit" => "users/registrations#edit", :as => "edit_user_registration"
    put "user" => "users/registrations#update", :as => "user_registration"
  end

  # Ruta para suscribirle a los newsletter

end
