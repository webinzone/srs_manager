# derived from base controller
class ResidentsController < BaseController

  #authenticate if user logged.
  before_action :authenticate_user!

	def index
   	@page_title = "Residents | Home"
   	get_collection
	end
	

  def new
	  new_resident
	 	@page_title = "Residents | New Resident"   
	end
	
	def show
		@resident=Resident.find(params[:id])
	end
	
	def edit
		@resident=Resident.find(params[:id])
   	@page_title = "Residents | Update Residents"   	
	end
  
  def create
	 	@resident=Resident.new(permitted_params)
    if @resident.valid?
      @resident.save
      redirect_to residents_path
	 	else
      redirect_to home_index_path

	 	end
	end

	def update
    @resident=Resident.find(params[:id])
	  @resident.update(permitted_params)
	  if @resident.save
      redirect_to residents_path
		else
      redirect_to home_index_path

		end
	end
	
  def destroy
		@resident = Resident.find(params[:id])
    if @resident.destroy
      redirect_to residents_path
    else
      redirect_to home_index_path
    end
  end
    
  # --------------
  # Fetch Methods
  # --------------

	private

	def permitted_params
    params.require(:resident).permit(:surname,:fname,:mname,:prefered_name,:gender,:room_no,:fee,:bed,:pay_frequency,:dob,:payment_via,:arrival_date,:admin,:person_type,:guardian,:nationality,:health_service,:marital_status,:case_manager,:language_spoken,:medical_practioner,:next_kin,:departure_date,:image)
	end

  def new_resident
    @resident = Resident.new
  end

  def existing_resident
    @resident = Resident.find_by_id(params[:id])
  end

  def get_collection
    @relation = Resident.where("")

    apply_filters

    @order_by = "created_at DESC" unless @order_by
    @residents = @r_objects = @relation.order(@order_by).all #page(@current_page).per(@per_page)
  end
  
  def apply_filters
    @query = params[:q]
    @relation = @relation.search(@query) if @query && !@query.blank?
    #@relation = @relation.search_only_name(params[:filters].try(:[], :name))
    
  end




	
end
