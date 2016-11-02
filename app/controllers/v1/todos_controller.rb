module V1
  class TodosController < ApplicationController
    wrap_parameters :todo

    def index
      todos = Todo.all.to_json

      respond_with todos
    end

    def create
      todo = Todo.create(name: params["name"], complete: params["complete"])
      respond_with(todo, serializer: TodoSerializer)
    end

    def update
      todo = Todo.find(params["id"])
      todo.update_attributes(name: params["name"], complete: params["complete"])
      respond_with(todo, serializer: TodoSerializer)
    end

    def destroy
      todo = Todo.find(params["id"]).destroy
      respond_with(todo, serializer: TodoSerializer)
    end
  end
end
