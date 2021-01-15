# derived from base controller
class SrsReferalsController < BaseController

  #authenticate if user logged.
  before_action :authenticate_user!

	def index
   	@page_title = "SRS Referals | Home"
   	get_collection
	end
	

  def new
	  new_srs_referal
	 	@page_title = "SRS Referals | New Referals"   
	end
	
	def show
		@srs_referal=SrsReferal.find(params[:id])
	end
	
	def edit
		@srs_referal=SrsReferal.find(params[:id])
   	@page_title = "SRS Referals | Update Referals"   	
	end
  
  def create
	 	@srs_referal=SrsReferal.new(permitted_params)
    if @srs_referal.valid?
      @srs_referal.save
      redirect_to srs_referals_path
	 	else
      redirect_to home_index_path

	 	end
	end

	def update
    @srs_referal=SrsReferal.find(params[:id])
	  @srs_referal.update(permitted_params)
	  if @srs_referal.save
      redirect_to srs_referals_path
		else
      redirect_to home_index_path

		end
	end
	
  def destroy
		@srs_referal = SrsReferal.find(params[:id])
    if @srs_referal.destroy
      redirect_to srs_referals_path
    else
      redirect_to home_index_path
    end
  end
    
  # --------------
  # Fetch Methods
  # --------------

	private

	def permitted_params
    params.require(:srs_referal).permit(:user_name,:address,:telephone,:fax,:email,:phone2,:email2,:address2,:r_name,:p_name,:dob,:nok,:case_manager,:gaurdian,:practitioner,:nomini,:admin,:medicare_no,:pension,:languages,:religous,:nationality,:diagnosis)
	end

  def new_srs_referal
    @srs_referal = SrsReferal.new
  end

  def existing_srs_referal
    @srs_referal = SrsReferal.find_by_id(params[:id])
  end

  def get_collection
    @relation = SrsReferal.where("")

    apply_filters

    @order_by = "created_at DESC" unless @order_by
    @srs_referals = @r_objects = @relation.order(@order_by).all #page(@current_page).per(@per_page)
  end
  
  def apply_filters
    @query = params[:q]
    @relation = @relation.search(@query) if @query && !@query.blank?
    #@relation = @relation.search_only_name(params[:filters].try(:[], :name))
    
  end






	
end
