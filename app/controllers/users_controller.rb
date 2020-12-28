# derived from base controller
class UsersController < BaseController

  #authenticate if user logged.
  before_action :authenticate_user!

	def index
   	@page_title = "User | Profile"
   	get_collection
	end
	
  def new
    new_user
   	@page_title = "User | New Profile"   
	end
	
	def show
		@user=User.find(params[:id])
	end
	
	def edit
		@user=User.find(params[:id])
   	@page_title = "User | Update Profile"   	
	end
  
  def create
	 	@user=User.new(permitted_params)
    @user.user_id=current_user.id      
    if @user.valid?
      @user.save
      redirect_to home_path(current_user)
	 	else
      redirect_to home_index_path

	 	end
	end

	def update
    @user=User.find(params[:id])
	  @user.update(permitted_params)
	  if @user.save
      redirect_to home_path(current_user)
		else
      redirect_to home_index_path

		end
	end
	
  def destroy
		@user = User.find(params[:id])
    if @user.destroy
      redirect_to home_path(current_user)
    else
      redirect_to home_index_path
    end
  end
    
  # --------------
  # Fetch Methods
  # --------------

	private

	def permitted_params
    params.require(:user).permit(:name, :email, :password)
	end

  def new_user
    @user = User.new
  end

  def existing_user
    @user = User.find_by_id(params[:id])
  end

  def get_collection
    @relation = User.where("")

    apply_filters

    @order_by = "created_at DESC" unless @order_by
    @users = @r_objects = @relation.order(@order_by).all #page(@current_page).per(@per_page)
  end
  
  def apply_filters
    @query = params[:q]
    @relation = @relation.search(@query) if @query && !@query.blank?
    #@relation = @relation.search_only_name(params[:filters].try(:[], :name))
    
  end



	
end
