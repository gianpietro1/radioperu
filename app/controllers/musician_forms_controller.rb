class MusicianFormsController < ApplicationController
 
  def new
    @musician_form = MusicianForm.new
  end

  def create
    @musician_form = MusicianForm.new(params[:musician_form])
    @musician_form.request = request
    if @musician_form.deliver
      flash.now[:notice] = t(:form_email_success)
    else
      flash[:error] = t(:form_error)      
      render :new
    end
    rescue ScriptError
      flash[:error] = t(:email_error)
  end
  
end
