# derived from base controller
class StaffRostersController < BaseController

  #authenticate if user logged.
  before_action :authenticate_user!

	def index
   	@page_title = "Staff Rosters | Home"
   	get_collection
	end
	
  def new
    new_staff_roster
   	@page_title = "Staff Rosters | New Complaint"   
	end
	
	def show
    @page_title = "Staff Roster"
		@staff_roster=StaffRoster.find(params[:id])
	end
	
	def edit
		@staff_roster=StaffRoster.find(params[:id])
   	@page_title = "Staff Rosters | Update Staff Rosters"   	
	end
  
  def create
	 	@staff_roster=StaffRoster.new(permitted_params)
    if @staff_roster.valid?
      @staff_roster.save
      redirect_to staff_rosters_path
	 	else
      redirect_to home_index_path

	 	end
	end

	def update
    @staff_roster=StaffRoster.find(params[:id])
	  @staff_roster.update(permitted_params)
	  if @staff_roster.save
      redirect_to staff_rosters_path
		else
      redirect_to home_index_path

		end
	end
	
  def destroy
		@staff_roster = StaffRoster.find(params[:id])
    if @staff_roster.destroy
      redirect_to staff_rosters_path
    else
      redirect_to home_index_path
    end
  end
    
  # --------------
  # Fetch Methods
  # --------------

	private

	def permitted_params
    params.require(:staff_roster).permit(:date,:staff_name,:position,:monday,:tuesday,:wednesday,:thursday,:friday,:saturday,:sunday,:total_hrs,:total)
	end

  def new_staff_roster
    @staff_roster = StaffRoster.new
  end

  def existing_staff_roster
    @staff_roster = StaffRoster.find_by_id(params[:id])
  end

  def get_collection
    @relation = StaffRoster.where("")

    apply_filters

    @order_by = "created_at DESC" unless @order_by
    @staff_rosters = @r_objects = @relation.order(@order_by).all #page(@current_page).per(@per_page)
  end
  
  def apply_filters
    @query = params[:q]
    @relation = @relation.search(@query) if @query && !@query.blank?
    #@relation = @relation.search_only_name(params[:filters].try(:[], :name))
    
  end



	
end
