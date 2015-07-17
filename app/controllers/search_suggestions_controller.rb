class SearchSuggestionsController < ApplicationController

  def index
    @search_array = []
    Artist.search_by_name(params[:term]).map do |artist|
      @search_array << {label: artist.name, category: t(:artists), model: "Artist", model_id: artist.id}
    end
    Album.search_by_name(params[:term]).map do |album|
      @search_array << {label: album.name + " - " + album.artist.name, category: t(:albums), model: "Album", model_id: album.id, parent_model_id: album.artist.id}
    end
    Song.search_by_name(params[:term]).map do |song|
      @search_array << {label: song.name + " - " + song.album.name + " - " + song.album.artist.name, category: t(:songs), model: "Song", model_id: song.id, parent_model_id: song.album.id, gparent_model_id: song.album.artist.id}
    end
    render json: @search_array
  end

end