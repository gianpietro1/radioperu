class SongsController < ApplicationController
  def show
    @song = Song.find(params[:id])
  end

  def edit
  end

  private

  def song_params
    params.require(:song).permit(:discnum, :track, :name, :filename, :length)
  end

end
