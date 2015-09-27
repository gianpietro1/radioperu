class AdminController < ApplicationController
  def index
    @artists = Artist.reorder("updated_at desc")
  end
end
