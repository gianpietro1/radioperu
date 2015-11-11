class TestController < ApplicationController
  
  respond_to :html, :js

  def index
  end

  def test_instagram
    respond_with() do |format|
      format.html {render :partial => "test_instagram" }
    end
  end

end