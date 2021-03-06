# derived from base controller
class ComplaintsController < BaseController

  #authenticate if user logged.
  before_action :authenticate_user!

	def index
   	@page_title = "Complaints | Home"
   	get_collection
	end
	
  def new
    new_complaint
   	@page_title = "Complaints | New Complaint"   
	end
	
	def show
    @page_title = "Complaint"
		@complaint=Complaint.find(params[:id])
	end
	
	def edit
		@complaint=Complaint.find(params[:id])
   	@page_title = "Complaints | Update Complaints"   	
	end
  
  def create
	 	@complaint=Complaint.new(permitted_params)
    @complaint.user_id=current_user.id      
    if @complaint.valid?
      @complaint.save
      redirect_to complaints_path
	 	else
      redirect_to home_index_path

	 	end
	end

	def update
    @complaint=Complaint.find(params[:id])
	  @complaint.update(permitted_params)
	  if @complaint.save
      redirect_to complaints_path
		else
      redirect_to home_index_path

		end
	end
	
  def destroy
		@complaint = Complaint.find(params[:id])
    if @complaint.destroy
      redirect_to complaints_path
    else
      redirect_to home_index_path
    end
  end
    
  # --------------
  # Fetch Methods
  # --------------

	private

	def permitted_params
    params.require(:complaint).permit(:complaint, :nature, :action, :method, :user_name)
	end

  def new_complaint
    @complaint = Complaint.new
  end

  def existing_complaint
    @complaint = Complaint.find_by_id(params[:id])
  end

  def get_collection
    @relation = Complaint.where("")

    apply_filters

    @order_by = "created_at DESC" unless @order_by
    @complaints = @r_objects = @relation.order(@order_by).all #page(@current_page).per(@per_page)
  end
  
  def apply_filters
    @query = params[:q]
    @relation = @relation.search(@query) if @query && !@query.blank?
    #@relation = @relation.search_only_name(params[:filters].try(:[], :name))
    
  end



	
end
