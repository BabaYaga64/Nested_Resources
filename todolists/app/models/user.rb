class User < ActiveRecord::Base

	# This will define a password property that will get processed into an encrpyted hash stored in the password_digest database column. 
	has_secure_password

	has_one :profile, dependent: :destroy
	has_many :todo_lists, dependent: :destroy
	# Implement a 1:many through relationship from User to ToDoItem by using the 1:many relationship from User to ToDoLists as a source. 
	has_many :todo_items, through: :todo_lists, source: :todo_items, dependent: :destroy
	# Define a validation for username to enforce that username be supplied by using a built-in validator
	validates :username, presence: true

def get_completed_count
		User.find(self.id).todo_items.where(completed:true).count
	end


end
