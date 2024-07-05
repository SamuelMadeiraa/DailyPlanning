Rails.application.routes.draw do
  root 'home#index'
  resources :compromissos
  resources :estudos
  resources :financeiro
  resources :tarefas
  end



