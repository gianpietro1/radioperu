I18n.locale = "es"

User.create!([
  {email: "admin@example.com", password: "helloworld", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-05-29 17:13:57", last_sign_in_at: "2015-05-29 17:13:57", current_sign_in_ip: "::1", last_sign_in_ip: "::1", confirmation_token: nil, confirmed_at: "2015-05-29 17:13:31", confirmation_sent_at: nil, unconfirmed_email: nil, name: "Admin User", username: nil, role: 'admin'}
])

Radio.create([
  {player: "http://player.radiocdn.com/iframe.js?hash=b1186bab4c3575dae59ba0cb42ba4a06abc52cf3-118-41", host: "delicious.wavestreamer.com", port: 3556},
  {player: "http://player.radiocdn.com/iframe.js?hash=de2fa7aa3279d4bef0ae03010d0b3a0fba32c926-118-41", host: "knight.wavestreamer.com", port: 9478},
  {player: "http://player.radiocdn.com/iframe.js?hash=4d6c75a8560f4960f5b5488cb73137151af78a1e-118-41", host: "delicious.wavestreamer.com", port: 2146},
  {player: "http://player.radiocdn.com/iframe.js?hash=5fd8f059ce3ed62bb42b0a1ba74a09c5245c2c1e-118-41", host: "knight.wavestreamer.com", port: 9214},
  {player: "http://player.radiocdn.com/iframe.js?hash=61346ceae3b02d00ec378fb796565f0990eadc55-118-41", host: "delicious.wavestreamer.com", port: 4639}
])

Radio.find_by_id(1).set_translations(:en => { :name => 'Station 1', :description => 'coast & folk' }, :es => { :name => 'Estación 1', :description => 'costeña y canción'} )
Radio.find_by_id(2).set_translations(:en => { :name => 'Station 2', :description => 'andean' }, :es => { :name => 'Estación 2', :description => 'andina'} )
Radio.find_by_id(3).set_translations(:en => { :name => 'Station 3', :description => 'tropical' }, :es => { :name => 'Estación 3', :description => 'tropical'} )
Radio.find_by_id(4).set_translations(:en => { :name => 'Station 4', :description => 'rock, pop & related' }, :es => { :name => 'Estación 4', :description => 'rock, pop y afines'} )
Radio.find_by_id(5).set_translations(:en => { :name => 'Station 5', :description => 'instrumental' }, :es => { :name => 'Estación 5', :description => 'instrumental'} )

Radio.first.genres.create(name:"Criollo")
Radio.first.genres.create(name:"Trova")
Radio.first.genres.create(name:"Canción de Autor")
Radio.first.genres.create(name:"Afroperuano")
Radio.find_by_id(2).genres.create(name:"Andino")
Radio.find_by_id(3).genres.create(name:"Salsa")
Radio.find_by_id(3).genres.create(name:"Cumbia")
Radio.find_by_id(3).genres.create(name:"Chicha")
Radio.find_by_id(3).genres.create(name:"Tropical")
Radio.find_by_id(3).genres.create(name:"Techno-cumbia")
Radio.find_by_id(4).genres.create(name:"Rock")
Radio.find_by_id(4).genres.create(name:"Pop")
Radio.find_by_id(4).genres.create(name:"Reggae")
Radio.find_by_id(4).genres.create(name:"Metal")
Radio.find_by_id(4).genres.create(name:"Funk")
Radio.find_by_id(4).genres.create(name:"Fusión")
Radio.find_by_id(4).genres.create(name:"Balada")
Radio.find_by_id(4).genres.create(name:"Hip Hop")
Radio.find_by_id(4).genres.create(name:"Nueva Ola")
Radio.find_by_id(4).genres.create(name:"Punk")
Radio.find_by_id(4).genres.create(name:"Ska")
Radio.find_by_id(4).genres.create(name:"Rap")
Radio.find_by_id(4).genres.create(name:"Indie")
Radio.find_by_id(5).genres.create(name:"Electrónica")
Radio.find_by_id(5).genres.create(name:"Clásica")
Radio.find_by_id(5).genres.create(name:"Jazz")
Radio.find_by_id(5).genres.create(name:"Música del mundo")
Radio.find_by_id(5).genres.create(name:"Académica")
Radio.find_by_id(5).genres.create(name:"Fusión Instrumental")

Genre.find_by_id(1).set_translations(:en => { :name => 'Creole' }, :es => { :name => 'Criollo'})
Genre.find_by_id(2).set_translations(:en => { :name => 'Trova' }, :es => { :name => 'Trova'})
Genre.find_by_id(3).set_translations(:en => { :name => 'Cancion de Autor' }, :es => { :name => 'Canción de Autor'})
Genre.find_by_id(4).set_translations(:en => { :name => 'Afro-Peruvian' }, :es => { :name => 'Afroperuano'})
Genre.find_by_id(5).set_translations(:en => { :name => 'Andean' }, :es => { :name => 'Andino'})
Genre.find_by_id(6).set_translations(:en => { :name => 'Salsa' }, :es => { :name => 'Salsa'})
Genre.find_by_id(7).set_translations(:en => { :name => 'Cumbia' }, :es => { :name => 'Cumbia'})
Genre.find_by_id(8).set_translations(:en => { :name => 'Chicha' }, :es => { :name => 'Chicha'})
Genre.find_by_id(9).set_translations(:en => { :name => 'Tropical' }, :es => { :name => 'Tropical'})
Genre.find_by_id(10).set_translations(:en => { :name => 'Techno-cumbia' }, :es => { :name => 'Techno-cumbia'})
Genre.find_by_id(11).set_translations(:en => { :name => 'Rock' }, :es => { :name => 'Rock'})
Genre.find_by_id(12).set_translations(:en => { :name => 'Pop' }, :es => { :name => 'Pop'})
Genre.find_by_id(13).set_translations(:en => { :name => 'Reggae' }, :es => { :name => 'Reggae'})
Genre.find_by_id(14).set_translations(:en => { :name => 'Metal' }, :es => { :name => 'Metal'})
Genre.find_by_id(15).set_translations(:en => { :name => 'Funk' }, :es => { :name => 'Funk'})
Genre.find_by_id(16).set_translations(:en => { :name => 'Fusion' }, :es => { :name => 'Fusión'})
Genre.find_by_id(17).set_translations(:en => { :name => 'Ballad' }, :es => { :name => 'Balada'})
Genre.find_by_id(18).set_translations(:en => { :name => 'Hip Hop' }, :es => { :name => 'Hip Hop'})
Genre.find_by_id(19).set_translations(:en => { :name => 'New Wave' }, :es => { :name => 'Nueva Ola'})
Genre.find_by_id(20).set_translations(:en => { :name => 'Punk' }, :es => { :name => 'Punk'})
Genre.find_by_id(21).set_translations(:en => { :name => 'Ska' }, :es => { :name => 'Ska'})
Genre.find_by_id(22).set_translations(:en => { :name => 'Rap' }, :es => { :name => 'Rap'})
Genre.find_by_id(23).set_translations(:en => { :name => 'Indie' }, :es => { :name => 'Indie'})
Genre.find_by_id(24).set_translations(:en => { :name => 'Electronica' }, :es => { :name => 'Electrónica'})
Genre.find_by_id(25).set_translations(:en => { :name => 'Classical' }, :es => { :name => 'Clásica'})
Genre.find_by_id(26).set_translations(:en => { :name => 'Jazz' }, :es => { :name => 'Jazz'})
Genre.find_by_id(27).set_translations(:en => { :name => 'World Music' }, :es => { :name => 'Música del mundo'})
Genre.find_by_id(28).set_translations(:en => { :name => 'Academic' }, :es => { :name => 'Académica'})
Genre.find_by_id(29).set_translations(:en => { :name => 'Instrumental Fusion' }, :es => { :name => 'Fusión Instrumental'})

Genre.find_by_id(1).set_translations(:en => { :name => 'Creole' }, :es => { :name => 'Criollo'})
Genre.find_by_id(2).set_translations(:en => { :name => 'Trova' }, :es => { :name => 'Trova'})
Genre.find_by_id(3).set_translations(:en => { :name => 'Cancion de Autor' }, :es => { :name => 'Canción de Autor'})
Genre.find_by_id(4).set_translations(:en => { :name => 'Afro-Peruvian' }, :es => { :name => 'Afroperuano'})
Genre.find_by_id(5).set_translations(:en => { :name => 'Andean' }, :es => { :name => 'Andino'})
Genre.find_by_id(6).set_translations(:en => { :name => 'Salsa' }, :es => { :name => 'Salsa'})
Genre.find_by_id(7).set_translations(:en => { :name => 'Cumbia' }, :es => { :name => 'Cumbia'})
Genre.find_by_id(8).set_translations(:en => { :name => 'Chicha' }, :es => { :name => 'Chicha'})
Genre.find_by_id(9).set_translations(:en => { :name => 'Tropical' }, :es => { :name => 'Tropical'})
Genre.find_by_id(10).set_translations(:en => { :name => 'Techno-cumbia' }, :es => { :name => 'Techno-cumbia'})
Genre.find_by_id(11).set_translations(:en => { :name => 'Rock' }, :es => { :name => 'Rock'})
Genre.find_by_id(12).set_translations(:en => { :name => 'Pop' }, :es => { :name => 'Pop'})
Genre.find_by_id(13).set_translations(:en => { :name => 'Reggae' }, :es => { :name => 'Reggae'})
Genre.find_by_id(14).set_translations(:en => { :name => 'Metal' }, :es => { :name => 'Metal'})
Genre.find_by_id(15).set_translations(:en => { :name => 'Funk' }, :es => { :name => 'Funk'})
Genre.find_by_id(16).set_translations(:en => { :name => 'Fusion' }, :es => { :name => 'Fusión'})
Genre.find_by_id(17).set_translations(:en => { :name => 'Ballad' }, :es => { :name => 'Balada'})
Genre.find_by_id(18).set_translations(:en => { :name => 'Hip Hop' }, :es => { :name => 'Hip Hop'})
Genre.find_by_id(19).set_translations(:en => { :name => 'New Wave' }, :es => { :name => 'Nueva Ola'})
Genre.find_by_id(20).set_translations(:en => { :name => 'Punk' }, :es => { :name => 'Punk'})
Genre.find_by_id(21).set_translations(:en => { :name => 'Ska' }, :es => { :name => 'Ska'})
Genre.find_by_id(22).set_translations(:en => { :name => 'Rap' }, :es => { :name => 'Rap'})
Genre.find_by_id(23).set_translations(:en => { :name => 'Indie' }, :es => { :name => 'Indie'})
Genre.find_by_id(24).set_translations(:en => { :name => 'Electronica' }, :es => { :name => 'Electrónica'})
Genre.find_by_id(25).set_translations(:en => { :name => 'Classical' }, :es => { :name => 'Clásica'})
Genre.find_by_id(26).set_translations(:en => { :name => 'Jazz' }, :es => { :name => 'Jazz'})
Genre.find_by_id(27).set_translations(:en => { :name => 'World Music' }, :es => { :name => 'Música del mundo'})
Genre.find_by_id(28).set_translations(:en => { :name => 'Academic' }, :es => { :name => 'Académica'})
Genre.find_by_id(29).set_translations(:en => { :name => 'Instrumental Fusion' }, :es => { :name => 'Fusión Instrumental'})

I18n.locale = "es"
Format.create(name:"CD")
Format.create(name:"Vinilo")
Format.create(name:"Cassette")
Format.create(name:"Desconocido")

I18n.locale = "en"
Format.find_by_id(1).update_attributes(name:"CD")
Format.find_by_id(2).update_attributes(name:"Vinyl")
Format.find_by_id(3).update_attributes(name:"Cassette")
Format.find_by_id(4).update_attributes(name:"Unknown")