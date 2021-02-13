# derived from base controller
class FileReportsController < BaseController

  #authenticate if user logged.
  before_action :authenticate_user!
  

	def index
   	@page_title = "FileReports | Home"
   	get_collection
	end
	

 def new
    new_file_report
   	@page_title = "FileReports | New FileReport"   
	end
	
	def show
		@file_report=FileReport.find(params[:id])
	end
	
	def edit
		@file_report=FileReport.find(params[:id])
   	@page_title = "FileReports | Update FileReports"   	
	end
  
  def create
    uploaded_io = params[:file_name]
    @path = "#{Rails.root}/public/uploads/UPLOAD_DATA_#{DateTime.now.strftime '%d.%m.%Y:%H.%M.%S'}.odt"

    File.open(@path, "wb") { |f| f.write(uploaded_io.read)}
    @file_report=FileReport.new(permitted_params)
    @file_report.file_name = @path
        
    if @file_report.valid?
      @file_report.save
      redirect_to file_reports_path
	 	else
      redirect_to home_index_path

	 	end
	end

	def update
    @file_report=FileReport.find(params[:id])
	  @file_report.update(permitted_params)
	  if @file_report.save
      redirect_to file_reports_path
		else
      redirect_to home_index_path

		end
	end
	
  def destroy
		@file_report = FileReport.find(params[:id])
    if @file_report.destroy
      redirect_to file_reports_path
    else
      redirect_to home_index_path
    end
  end
    
  # --------------
  # Fetch Methods
  # --------------

	private

	def permitted_params
    params.require(:file_report).permit(:user_name,:tittle,:desc,)
	end

  def new_file_report
    @file_report = FileReport.new
  end

  def existing_FileReport
    @file_report = FileReport.find_by_id(params[:id])
  end

  def get_collection
    @relation = FileReport.where("")

    apply_filters

    @order_by = "created_at DESC" unless @order_by
    @file_reports = @r_objects = @relation.order(@order_by).all #page(@current_page).per(@per_page)
  end
  
  def apply_filters
    @query = params[:q]
    @relation = @relation.search(@query) if @query && !@query.blank?
    #@relation = @relation.search_only_name(params[:filters].try(:[], :name))
    
  end


	
end
