# derived from base controller
class SupportPlansController < BaseController

  #authenticate if user logged.
  before_action :authenticate_user!

	def index
   	@page_title = "Support Plans | Home"
   	get_collection
	end
	
  def new
    new_support_plan
   	@page_title = "Support Plans | New Support Plans"   
	end
	
	def show
    @page_title = "Support Plan"
		@support_plan=SupportPlan.find(params[:id])
	end
	
	def edit
		@support_plan=SupportPlan.find(params[:id])
   	@page_title = "Support Plans | Update Support Plans"   	
	end
  
  def create
	 	@support_plan=SupportPlan.new(permitted_params)
    if @support_plan.valid?
      @support_plan.save
      redirect_to support_plans_path
	 	else
      redirect_to home_index_path

	 	end
	end

	def update
    @support_plan=SupportPlan.find(params[:id])
	  @support_plan.update(permitted_params)
	  if @support_plan.save
      redirect_to support_plans_path
		else
      redirect_to home_index_path

		end
	end
	
  def destroy
		@support_plan = SupportPlan.find(params[:id])
    if @support_plan.destroy
      redirect_to support_plans_path
    else
      redirect_to home_index_path
    end
  end
    
  # --------------
  # Fetch Methods
  # --------------

	private

	def permitted_params
    params.require(:support_plan).permit(:user_name, :Hygiene, :nutrition, :health_care, :medication, :social_contact, :behaviour, :goals, :mobility)
	end

  def new_support_plan
    @support_plan = SupportPlan.new
  end

  def existing_support_plan
    @support_plan = SupportPlan.find_by_id(params[:id])
  end

  def get_collection
    @relation = SupportPlan.where("")

    apply_filters

    @order_by = "created_at DESC" unless @order_by
    @support_plans = @r_objects = @relation.order(@order_by).all #page(@current_page).per(@per_page)
  end
  
  def apply_filters
    @query = params[:q]
    @relation = @relation.search(@query) if @query && !@query.blank?
    #@relation = @relation.search_only_name(params[:filters].try(:[], :name))
    
  end





	
end
