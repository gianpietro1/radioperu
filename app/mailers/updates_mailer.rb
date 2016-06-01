require 'digest/sha2' 
class UpdatesMailer < ApplicationMailer
  
  default from: "postmaster@radioperu.pe" 
      
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

      def new_comment_update(user,page_admin,comment)

        setup_email
 
        @user = user
        @page_admin = page_admin
        @comment = comment

        if @comment.commentable_type == 'Playlist'
          mail(from: "Radioperú.pe <contacto@radioperu.pe>", to: @page_admin.email, subject: "Nuevo comentario en tu lista")
        else
          mail(from: "Radioperú.pe <contacto@radioperu.pe>", to: @page_admin.email, subject: "Nuevo comentario en tu espacio")          
        end

      end

      def new_reply_update(user,parent_user,comment)

        setup_email
 
        @user = user
        @parent_user = parent_user
        @comment = comment

        mail(from: "Radioperú.pe <contacto@radioperu.pe>", to: @parent_user.email, subject: "Alguien respondió a tu comentario")
      end

private

  def setup_email
    headers["Message-ID"] = "#{Digest::SHA2.hexdigest(Time.now.to_i.to_s)}@radioperu.pe>"
    headers["Reply-to"] = "contacto@radioperu.pe"
  end

end
