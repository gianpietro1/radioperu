class Song < ActiveRecord::Base

  autocomplete :name, :score => :id

  translates :review
  belongs_to :album
  belongs_to :genre

  mount_uploader :filename, FilenameUploader

  default_scope { order('discnum ASC', 'track ASC') }

  after_create :inherit_genre
  
  def id3
  end

  private

    def inherit_genre
      if self.album.genre_id
        self.genre_id = self.album.genre_id
      elsif self.album.artist.genre_id
        self.genre_id = self.album_artist.genre_id
      end
    end

end