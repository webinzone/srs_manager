class ProfileController < BaseController
 
    before_action :authenticate_user!
    before_action :get_user
   
    def index
      @page_title = "user  |profile"   
    end
   
    def update
     
     @user.assign_attributes(permitted_params)
      
      if @user.valid?
        @user.save
       set_notification(true, I18n.t('status.success'), I18n.t('success.updated', item: "ClientUser"))
       set_flash_message(I18n.translate("success.updated", item: "ClientUser"), :success)
      else
        message = I18n.t('errors.failed_to_update', item: "ClientUser")
        @user.errors.add :base, message
        set_notification(false, I18n.t('status.error'), message)
        set_flash_message('The form has some errors. Please correct them and submit again', :error)
      end
    end
    
    def update_password
       @user=current_user
       
       if @user.update_with_password(permitted_params)
          set_notification(true, I18n.t('status.success'), I18n.t('success.updated', item: "Password"))
      else
        message = I18n.t('errors.failed_to_update', item: "Password")
        @user.errors.add :base, message
        set_notification(false, I18n.t('status.error'), message)
      end
    end
    
    
    private
    
     def get_user
      @user = current_user
    end
   
   def permitted_params
      params.require(:user).permit(
        :id,
        :name,
        :email
        )
    end
end

