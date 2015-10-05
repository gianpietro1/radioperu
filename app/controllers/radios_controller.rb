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
    @active_program = Program.find_by_id(params[:current_program_id])
    @radio = Radio.find(params[:radio_id])
    respond_with(@active_program) do |format|
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

  def share_song
    @artist = params[:artist_name]
    @song = params[:song_name]
    @radio_id = params[:radio_id]
    respond_with(@artist,@song,@radio) do |format|
    format.html {render :partial => "share_song" }
    end
  end


end