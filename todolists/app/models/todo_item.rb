class TodoItem < ActiveRecord::Base
  belongs_to :todo_list
  # Add a default scope to always return collections from the database ordered by due dates with earliest dates first. 
  default_scope {order :due_date}
end
