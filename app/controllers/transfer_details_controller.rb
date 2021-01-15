# derived from base controller
class TransferDetailsController < BaseController

  #authenticate if user logged.
  before_action :authenticate_user!

	def index
   	@page_title = "Transfer Details | Home"
   	get_collection
	end
	

  def new
	  new_transfer_details
	 	@page_title = "Transfer Details | New "   
	end
	
	def show
		@transfer_detail=TransferDetail.find(params[:id])
	end
	
	def edit
		@transfer_detail=TransferDetail.find(params[:id])
   	@page_title = "Transfer Details | Update "   	
	end
  
  def create
	 	@transfer_detail=TransferDetail.new(permitted_params)
    if @transfer_detail.valid?
      @transfer_detail.save
      redirect_to transfer_details_path
	 	else
      redirect_to home_index_path

	 	end
	end

	def update
    @transfer_detail=TransferDetail.find(params[:id])
	  @transfer_detail.update(permitted_params)
	  if @transfer_detail.save
      redirect_to transfer_details_path
		else
      redirect_to home_index_path

		end
	end
	
  def destroy
		@transfer_detail = TransferDetail.find(params[:id])
    if @transfer_detail.destroy
      redirect_to transfer_details_path
    else
      redirect_to home_index_path
    end
  end
    
  # --------------
  # Fetch Methods
  # --------------

	private

	def permitted_params
    params.require(:transfer_detail).permit(:user_name,:dob,:gender,:nationality,:languages,:religion,:medicare_no,:pension_no,:chemist,:date,:from,:address,:ph,:fax,:to,:reason,:medication_chart,:medication_list,:websterpak,:medication_sent,:last_time_medication,:accompanying_reports,:next,:advised,:guardian,:guardian_advised,:case_manager,:case_manager_advised,:nomini,:nomini_advised,:admin,:admin_advised)
	end

  def new_transfer_details
    @transfer_detail = TransferDetail.new
  end

  def existing_transfer_details
    @transfer_detail = TransferDetail.find_by_id(params[:id])
  end

  def get_collection
    @relation = TransferDetail.where("")

    apply_filters

    @order_by = "created_at DESC" unless @order_by
    @transfer_details = @r_objects = @relation.order(@order_by).all #page(@current_page).per(@per_page)
  end
  
  def apply_filters
    @query = params[:q]
    @relation = @relation.search(@query) if @query && !@query.blank?
    #@relation = @relation.search_only_name(params[:filters].try(:[], :name))
    
  end



	
end
