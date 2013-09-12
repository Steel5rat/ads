module ApplicationHelper
	def get_names_of_users
		[[:user,1],[:admin,2]]
	end
	
	def is_admin?
		current_user.role == 2
	end
end
