class Song < ActiveRecord::Base

  autocomplete :name, :score => :id

  translates :review
  belongs_to :album
  belongs_to :artist

  mount_uploader :filename, FilenameUploader

  after_create :inherit_genre
  
  def id3
  end

  private

    def inherit_genre
      if self.album.genre
        self.genre = self.album.genre
      elsif self.artist.genre
        self.genre = self.artist.genre
      end
    end

end