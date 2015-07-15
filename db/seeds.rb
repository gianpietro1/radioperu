User.create!([
  {email: "admin@example.com", password: "helloworld", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-05-29 17:13:57", last_sign_in_at: "2015-05-29 17:13:57", current_sign_in_ip: "::1", last_sign_in_ip: "::1", confirmation_token: nil, confirmed_at: "2015-05-29 17:13:31", confirmation_sent_at: nil, unconfirmed_email: nil, name: "Admin User", username: nil, role: 'admin'}
])
Radio.create!([
  {player: "http://player.radiocdn.com/iframe.js?hash=5e6ead35300119bc5234f1800b455a948ddedf3d-118-41", host: "eclipse.wavestreaming.com", port: 3771, name: "Estación 1", description: "costeña y canción"},
  {player: "http://player.radiocdn.com/iframe.js?hash=5e6ead35300119bc5234f1800b455a948ddedf3d-118-41", host: "eclipse.wavestreaming.com", port: 3771, name: "Estación 2", description: "andina"},
  {player: "http://player.radiocdn.com/iframe.js?hash=5e6ead35300119bc5234f1800b455a948ddedf3d-118-41", host: "eclipse.wavestreaming.com", port: 3771, name: "Estación 3", description: "tropical"},
  {player: "http://player.radiocdn.com/iframe.js?hash=5e6ead35300119bc5234f1800b455a948ddedf3d-118-41", host: "eclipse.wavestreaming.com", port: 3771, name: "Estación 4", description: "rock, pop y afines"},
  {player: "http://player.radiocdn.com/iframe.js?hash=5e6ead35300119bc5234f1800b455a948ddedf3d-118-41", host: "eclipse.wavestreaming.com", port: 3771, name: "Estación 5", description: "instrumental"}
])
Radio::Translation.create!([
  {radio_id: 1, locale: "es", name: "Estación 1", description: "costeña y canción"},
  {radio_id: 2, locale: "es", name: "Estación 2", description: "andina"},
  {radio_id: 3, locale: "es", name: "Estación 3", description: "tropical"},
  {radio_id: 4, locale: "es", name: "Estación 4", description: "rock, pop y afines"},
  {radio_id: 5, locale: "es", name: "Estación 5", description: "instrumental"},
  {radio_id: 1, locale: "en", name: "station 1", description: "coast & folk"},
  {radio_id: 2, locale: "en", name: "station 2", description: "andean"},
  {radio_id: 3, locale: "en", name: "station 3", description: "tropical"},
  {radio_id: 4, locale: "en", name: "station 4", description: "rock, pop & related"},
  {radio_id: 5, locale: "en", name: "station 5", description: "instrumental"}
])

I18n.locale = "es"

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
Radio.find_by_id(5).genres.create(name:"Electrónica")
Radio.find_by_id(5).genres.create(name:"Clásica")
Radio.find_by_id(5).genres.create(name:"Jazz")
Radio.find_by_id(5).genres.create(name:"Música del mundo")
Radio.find_by_id(5).genres.create(name:"Académica")
Radio.find_by_id(5).genres.create(name:"Fusión Instrumental")

I18n.locale = "en"

Genre.find_by_id(1).set_translations(:en => { :name => 'Creole' }, :es => { :name => 'Criollo'})
Genre.find_by_id(2).set_translations(:en => { :name => 'Trova' }, :es => { :name => 'Trova'})
Genre.find_by_id(3).set_translations(:en => { :name => 'Canción de Autor' }, :es => { :name => 'Canción de Autor'})
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
Genre.find_by_id(23).set_translations(:en => { :name => 'Electronica' }, :es => { :name => 'Electrónica'})
Genre.find_by_id(24).set_translations(:en => { :name => 'Classic' }, :es => { :name => 'Clásica'})
Genre.find_by_id(25).set_translations(:en => { :name => 'Jazz' }, :es => { :name => 'Jazz'})
Genre.find_by_id(26).set_translations(:en => { :name => 'World Music' }, :es => { :name => 'Música del mundo'})
Genre.find_by_id(27).set_translations(:en => { :name => 'Academic' }, :es => { :name => 'Académica'})
Genre.find_by_id(28).set_translations(:en => { :name => 'Instrumental Fusion' }, :es => { :name => 'Fusión Instrumental'})

Genre.find_by_id(1).set_translations(:en => { :name => 'Creole' }, :es => { :name => 'Criollo'})
Genre.find_by_id(2).set_translations(:en => { :name => 'Trova' }, :es => { :name => 'Trova'})
Genre.find_by_id(3).set_translations(:en => { :name => 'Canción de Autor' }, :es => { :name => 'Canción de Autor'})
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
Genre.find_by_id(23).set_translations(:en => { :name => 'Electronica' }, :es => { :name => 'Electrónica'})
Genre.find_by_id(24).set_translations(:en => { :name => 'Classic' }, :es => { :name => 'Clásica'})
Genre.find_by_id(25).set_translations(:en => { :name => 'Jazz' }, :es => { :name => 'Jazz'})
Genre.find_by_id(26).set_translations(:en => { :name => 'World Music' }, :es => { :name => 'Música del mundo'})
Genre.find_by_id(27).set_translations(:en => { :name => 'Academic' }, :es => { :name => 'Académica'})
Genre.find_by_id(28).set_translations(:en => { :name => 'Instrumental Fusion' }, :es => { :name => 'Fusión Instrumental'})