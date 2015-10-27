class AddFacebookToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :social_fb, :string
  end
end
