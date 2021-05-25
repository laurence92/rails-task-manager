# As a user, I can list tasks
# As a user, I can view the details of a task
# As a user, I can add a new task
# As a user, I can edit a task (mark as completed / update title & details)
# As a user, I can remove a task

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  get "tasks", to: "tasks#index"
  get "tasks/new", to: "tasks#new", as: :new_task
  post "tasks", to: "tasks#create"
  # dynamic urls should be below static ones
  get "tasks/:id/edit", to: "tasks#edit", as: :edit_task
  patch "tasks/:id", to: "tasks#update"
  get "tasks/:id", to: "tasks#show", as: :task
  get "tasks/:id/delete", to: "tasks#destroy", as: :delete_task
end
