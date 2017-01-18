require 'digest/sha2' 
class UpdatesMailer < ApplicationMailer
  
  default from: "postmaster@radioperu.pe" 


      def new_artist_update(artist)
 
        setup_email
        @admin_emails = ['contacto@radioperu.pe','mkt@radioperu.pe']

        @artist = artist

        mail(to: @admin_emails, subject: "Artista #{artist.name} ha sido actualizado")
      end

      def new_album_update(artist,album)
 
        setup_email
        @admin_emails = ['contacto@radioperu.pe','mkt@radioperu.pe']

        @album = album
        @artist = album.artist
        @songs = album.songs
 
        mail(to: @admin_emails, subject: "Álbum #{artist.name}-#{album.name} ha sido actualizado")
      end

      def new_song_update(artist,song)

        setup_email
        @admin_emails = ['contacto@radioperu.pe','mkt@radioperu.pe']

        @song = song
        @artist = song.album.artist
 
        mail(to: @admin_emails, subject: "Canción #{artist.name}-#{song.name} ha sido actualizada")
      end

      def new_playlist_update(playlist)

        setup_email
        @admin_emails = ['contacto@radioperu.pe','mkt@radioperu.pe']

        @playlist = playlist
        @user = playlist.user
 
        mail(to: @admin_emails, subject: "Playlist #{@playlist.name}-#{@user.name} ha sido actualizado")
      end

      def new_user_update(user)

        setup_email
        @admin_emails = ['contacto@radioperu.pe','mkt@radioperu.pe']
 
        @user = user

        mail(to: @admin_emails, subject: "Nuevo usuario - #{@user.email}")
      end

      def new_comment_update(user,page_admin,comment)

        setup_email
 
        @user = user
        @page_admin = page_admin
        @comment = comment

        mail(from: "Radioperú.pe <contacto@radioperu.pe>", to: @page_admin.email, subject: "Nuevo comentario en tu espacio")          

      end

      def new_comment_playlist_update(user,page_admin,comment)

        setup_email
 
        @user = user
        @page_admin = page_admin
        @comment = comment

        mail(from: "Radioperú.pe <contacto@radioperu.pe>", to: @page_admin.email, subject: "Nuevo comentario en tu lista")

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
