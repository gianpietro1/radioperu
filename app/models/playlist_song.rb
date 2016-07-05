class PlaylistSong < ActiveRecord::Base
  belongs_to :playlist
  belongs_to :song

  def self.playlist_top_songs
    sql = 'select * from (select song_id, count(song_id) as counts from playlist_songs group by song_id order by count(song_id) desc) as e where counts >=4'
    records_array = ActiveRecord::Base.connection.execute(sql)
    return records_array
  end

end