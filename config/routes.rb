Rails.application.routes.draw do
  root 'home#index'
  get 'filtrar_compromissos_tarefas', to: 'compromissos#filtrar_compromissos_tarefas', as: :filtrar_compromissos_tarefas

  resources :estudos
  resources :financeiros
  resources :tarefas
  
  resources :compromissos
    
  
  
  
  

end
