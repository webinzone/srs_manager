# derived from base controller
class HomeController < BaseController

  #authenticate if user logged.
  before_action :authenticate_user!,except:[:new]

	def index	
	end

	
end
