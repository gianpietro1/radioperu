class Song < ActiveRecord::Base

  autocomplete :name, :score => :id

  translates :review
  belongs_to :album
  belongs_to :genre
  belongs_to :user

  mount_uploader :filename, FilenameUploader

  default_scope { order('discnum ASC', 'track ASC') }

  after_create :inherit_genre_and_user
  
  def id3
  end

  private

    def inherit_genre_and_user
      if self.album.genre_id
        self.update_attributes(genre_id: self.album.genre_id)
      elsif self.album.artist.genre_id
        self.update_attributes(genre_id: self.album_artist.genre_id)
      end
      self.update_attributes(user_id: self.album.user_id)
    end

end