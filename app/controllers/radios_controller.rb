class RadiosController < ApplicationController

  respond_to :html, :js

  def show
    @radio = Radio.find(params[:id])
    @radios = Radio.all
    @programs = @radio.programs
  end

  def program_index
    @radio = Radio.find_by_id(params[:radio_id])
    @programs = @radio.programs
    respond_with(@radio,@programs) do |format|
      format.html {render :partial => "programs/programs_index" }
    end
  end

  def program_sponsor
    @current_program_ajax = Program.find_by_id(params[:current_program_id])
    respond_with(@current_program_ajax) do |format|
      format.html {render :partial => "programs/program_sponsor" }
    end
  end

  def program_show
    @radio = Radio.find_by_id(params[:radio_id])
    @program = Program.find(params[:program_id])
    respond_with(@program, @radio) do |format|
      format.html {render :partial => "programs/program_show" }    
    end
  end

end