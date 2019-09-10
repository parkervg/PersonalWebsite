class ApplicationController < ActionController::Base
  add_flash_types :success, :warning, :danger
  helper_method :current_user, :show_resume

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def show_resume
    pdf_filename = File.join(Rails.root, "public/Resume.pdf")
    send_file(pdf_filename, :filename => "Resume.pdf", :disposition => 'inline', :type => "application/pdf")
    end
end
