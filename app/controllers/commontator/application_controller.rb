module Commontator
  class ApplicationController < ActionController::Base
    before_filter :get_user, :ensure_user
    
    cattr_accessor :commontable_url
    
    rescue_from SecurityTransgression, :with => lambda { head(:forbidden) }
    
    protected
    
    def get_user
      @user = Commontator.current_user_proc.call(self)	
    end

    def ensure_user
      security_transgression_unless(@user && @user.is_commontator)
    end
    
    def get_thread
      @thread = params[:thread_id].blank? ? \
        Commontator::Thread.find(params[:id]) : \
        Commontator::Thread.find(params[:thread_id])
      security_transgression_unless !@thread.commontable.nil?
    end
    
    def set_commontable_url
      self.commontable_url = @thread.config.commontable_url_proc.call(
                               @thread.commontable, main_app)
    end

    def security_transgression_unless(check)
      raise SecurityTransgression unless check
    end
  end
end
