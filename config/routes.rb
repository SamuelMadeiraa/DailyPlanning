Rails.application.routes.draw do
  root 'home#index'
  get 'filtrar_compromissos_tarefas', to: 'compromissos#filtrar_compromissos_tarefas', as: :filtrar_compromissos_tarefas
  
  resources :tarefas
  resources :estudos
  resources :categorium
  resources :financeiros do
    member do
      patch :pago
    end
  end
  
  resources :compromissos do
    member do
      patch :concluir
    end
  end
  
  
  
  

end
