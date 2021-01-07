# derived from base controller
class ResidentsAgreementsController < BaseController

  #authenticate if user logged.
  before_action :authenticate_user!

	def index
   	@page_title = "Residents Service Agreements | Home"
   	get_collection
	end
	

  def new
	  new_resident_agreement
	 	@page_title = "Residents  Service Agreements | New RSA"   
	end
	
	def show
		@resident_agreement=ResidentsAgreement.find(params[:id])
	end
	
	def edit
		@resident_agreement=ResidentsAgreement.find(params[:id])
   	@page_title = "Residents  Service Agreements | Update RSA"   	
	end
  
  def create
	 	@resident_agreement=ResidentsAgreement.new(permitted_params)
    if @resident_agreement.valid?
      @resident_agreement.save
      redirect_to residents_agreements_path
	 	else
      redirect_to home_index_path

	 	end
	end

	def update
    @resident_agreement=ResidentsAgreement.find(params[:id])
	  @resident_agreement.update(permitted_params)
	  if @resident_agreement.save
      redirect_to residents_agreements_path
		else
      redirect_to home_index_path

		end
	end
	
  def destroy
		@resident_agreement = ResidentsAgreement.find(params[:id])
    if @resident_agreement.destroy
      redirect_to residents_agreements_path
    else
      redirect_to home_index_path
    end
  end
    
  # --------------
  # Fetch Methods
  # --------------

	private

	def permitted_params
    params.require(:residents_agreement).permit(:user_name,:room_no,:bed,:dob,:guardian,:admin,:person_nominated,:stay_period,:fixed_period,:ending_on,:accommodation_fee,:payment_via,:payment_frequency,:advanced_fee,:security_deposit,:reservation_charge,:establishment,:condition_report_status,:services,:personal_properties,:special_items)
	end

  def new_resident_agreement
    @resident_agreement = ResidentsAgreement.new
  end

  def existing_resident_agreement
    @resident_agreement = ResidentsAgreement.find_by_id(params[:id])
  end

  def get_collection
    @relation = ResidentsAgreement.where("")

    apply_filters

    @order_by = "created_at DESC" unless @order_by
    @resident_agreements = @r_objects = @relation.order(@order_by).all #page(@current_page).per(@per_page)
  end
  
  def apply_filters
    @query = params[:q]
    @relation = @relation.search(@query) if @query && !@query.blank?
    #@relation = @relation.search_only_name(params[:filters].try(:[], :name))
    
  end




	
end
