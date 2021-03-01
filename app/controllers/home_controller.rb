# derived from base controller
class HomeController < BaseController

  #authenticate if user logged.
  before_action :authenticate_user!,except:[:new]

	def index
		@user_count = User.count
		@bookings = Booking.count
		@icreports = IncidentReport.count
		@complaints = Complaint.count
		@files = FileReport.count
		@rsa = ResidentsAgreement.count

	end
	def menu	
	end
   

	def invoice
		
	end

	def users
		get_collection
	end
	def show	
	  @user = User.find(params[:id])
	end

	def update
	  @user=User.find('1')
	  @user.update(permitted_params)
	  if @user.save
      redirect_to home_path(current_user)
		else
      redirect_to home_index_path
		end
		
	end

	

	private
		def get_collection
	    @relation = User.where("")

	    @order_by = "created_at DESC" unless @order_by
	    @users = @r_objects = @relation.order(@order_by).all #page(@current_page).per(@per_page)
	  end

	  def permitted_params
        params.require(:users).permit(:name, :email)
	end
	
end
