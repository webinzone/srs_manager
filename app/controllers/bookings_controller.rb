# derived from base controller
class BookingsController < BaseController

  #authenticate if user logged.
  before_action :authenticate_user!

	def index
   	@page_title = "Bookings | Home"
   	get_collection
	end
	

 def new
    new_booking
   	@page_title = "Bookings | New Booking"   
	end
	
	def show
		@booking=Booking.find(params[:id])
	end
	
	def edit
		@booking=Booking.find(params[:id])
   	@page_title = "Bookings | Update Bookings"   	
	end
  
  def create
	 	@booking=Booking.new(permitted_params)
    if @booking.valid?
      @booking.save
      redirect_to bookings_path
	 	else
      redirect_to home_index_path

	 	end
	end

	def update
    @booking=Booking.find(params[:id])
	  @booking.update(permitted_params)
	  if @booking.save
      redirect_to bookings_path
		else
      redirect_to home_index_path

		end
	end
	
  def destroy
		@booking = Booking.find(params[:id])
    if @booking.destroy
      redirect_to bookings_path
    else
      redirect_to home_index_path
    end
  end
    
  # --------------
  # Fetch Methods
  # --------------

	private

	def permitted_params
    params.require(:booking).permit(:user_name,:book_from,:book_to,:room,:bed,:payment,:fee,:dob,:age,:contact,:address,:discharge_reason,:car_needs,:diagnosis_history,:behaviours,:substance,:assistance,:casemanager,:social_worker,:forensic_history,:notes,:fee_freq)
	end

  def new_booking
    @booking = Booking.new
  end

  def existing_Booking
    @booking = Booking.find_by_id(params[:id])
  end

  def get_collection
    @relation = Booking.where("")

    apply_filters

    @order_by = "created_at DESC" unless @order_by
    @bookings = @r_objects = @relation.order(@order_by).all #page(@current_page).per(@per_page)
  end
  
  def apply_filters
    @query = params[:q]
    @relation = @relation.search(@query) if @query && !@query.blank?
    #@relation = @relation.search_only_name(params[:filters].try(:[], :name))
    
  end



	
end
