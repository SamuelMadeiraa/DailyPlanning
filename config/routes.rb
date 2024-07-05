Rails.application.routes.draw do
  root 'home#index'
  
  resources :compromissos do
    collection do
      get 'filtrar', to: 'compromissos#filtrar'
    end
  end
  
  resources :estudos
  resources :financeiro
  resources :tarefas
end
