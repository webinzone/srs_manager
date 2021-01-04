# derived from base controller
class IncidentReportsController < BaseController

  #authenticate if user logged.
  before_action :authenticate_user!

	def index
   	@page_title = "Incident Reports | Home"
   	get_collection
	end
	
  def new
    new_incident
   	@page_title = "Incident Reports | New Incident Reports"   
	end
	
	def show
  @page_title = "Incident Reports"
	@incident_report=IncidentReport.find(params[:id])
	end
	
	def edit
		@incident_report=IncidentReport.find(params[:id])
   	@page_title = "Incident Reports | Update Incident Reports"   	
	end
  
  def create
	  @incident_report=IncidentReport.new(permitted_params)
    if @incident_report.valid?
      @incident_report.save
      redirect_to incident_reports_path
	 	else
      redirect_to home_index_path

	 	end
	end

	def update
    @incident_report=IncidentReport.find(params[:id])
	  @incident_report.update(permitted_params)
	  if @incident_report.save
      redirect_to incident_reports_path
		else
      redirect_to home_index_path

		end
	end
	
  def destroy
		@incident_report = IncidentReport.find(params[:id])
    if @incident_report.destroy
      redirect_to incident_reports_path
    else
      redirect_to home_index_path
    end
  end
    
  # --------------
  # Fetch Methods
  # --------------

	private

	def permitted_params
    params.require(:incident_report).permit(:user_name, :incident_type, :other_type, :description, :action, :staff, :follow_notes, :follow_staff, :person_other, :notify_date)
	end

  def new_incident
    @incident_report = IncidentReport.new
  end

  def existing_incident
    @incident_report = IncidentReport.find_by_id(params[:id])
  end

  def get_collection
    @relation = IncidentReport.where("")

    apply_filters

    @order_by = "created_at DESC" unless @order_by
    @incident_reports = @r_objects = @relation.order(@order_by).all #page(@current_page).per(@per_page)
  end
  
  def apply_filters
    @query = params[:q]
    @relation = @relation.search(@query) if @query && !@query.blank?
    #@relation = @relation.search_only_name(params[:filters].try(:[], :name))
    
  end



	



	
end
