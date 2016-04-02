require 'digest/sha2' 
class UpdatesMailer < ApplicationMailer
  
  default from: "contacto@radioperu.pe" 
      
      def new_artist_update(artist)
 
        setup_email

        @artist = artist
 
        mail(to: 'contacto@radioperu.pe', subject: "Artista #{artist.name} ha sido actualizado")
      end

      def new_album_update(artist,album)
 
        setup_email

        @album = album
        @artist = album.artist
        @songs = album.songs
 
        mail(to: 'contacto@radioperu.pe', subject: "Álbum #{artist.name}-#{album.name} ha sido actualizado")
      end

      def new_song_update(artist,song)

        setup_email

        @song = song
        @artist = song.album.artist
 
        mail(to: 'contacto@radioperu.pe', subject: "Canción #{artist.name}-#{song.name} ha sido actualizada")
      end

      def new_playlist_update(playlist)

        setup_email

        @playlist = playlist
        @user = playlist.user
 
        mail(to: 'contacto@radioperu.pe', subject: "Playlist #{@playlist.name}-#{@user.name} ha sido actualizado")
      end

      def new_user_update(user)

        setup_email
 
        @user = user

        mail(to: 'contacto@radioperu.pe', subject: "Nuevo usuario - #{@user.email}")
      end

private

  def setup_email
    headers["Message-ID"] = "#{Digest::SHA2.hexdigest(Time.now.to_i.to_s)}@radioperu.pe>"
    headers["Reply-to"] = "contacto@radioperu.pe"
  end

end
