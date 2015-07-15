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

Genre::Translation.find_by_id(1).update_attributes(name:"Creole")
Genre::Translation.find_by_id(2).update_attributes(name:"Trova")
Genre::Translation.find_by_id(3).update_attributes(name:"Canción de Autor")
Genre::Translation.find_by_id(4).update_attributes(name:"Afro-Peruvian")
Genre::Translation.find_by_id(5).update_attributes(name:"Andean")
Genre::Translation.find_by_id(6).update_attributes(name:"Salsa")
Genre::Translation.find_by_id(7).update_attributes(name:"Cumbia")
Genre::Translation.find_by_id(8).update_attributes(name:"Chicha")
Genre::Translation.find_by_id(9).update_attributes(name:"Tropical")
Genre::Translation.find_by_id(10).update_attributes(name:"Techno-cumbia")
Genre::Translation.find_by_id(11).update_attributes(name:"Rock")
Genre::Translation.find_by_id(12).update_attributes(name:"Pop")
Genre::Translation.find_by_id(13).update_attributes(name:"Reggae")
Genre::Translation.find_by_id(14).update_attributes(name:"Metal")
Genre::Translation.find_by_id(15).update_attributes(name:"Funk")
Genre::Translation.find_by_id(16).update_attributes(name:"Fusion")
Genre::Translation.find_by_id(17).update_attributes(name:"Ballad")
Genre::Translation.find_by_id(18).update_attributes(name:"Hip Hop")
Genre::Translation.find_by_id(19).update_attributes(name:"New Wave")
Genre::Translation.find_by_id(20).update_attributes(name:"Punk")
Genre::Translation.find_by_id(21).update_attributes(name:"Ska")
Genre::Translation.find_by_id(22).update_attributes(name:"Rap")
Genre::Translation.find_by_id(23).update_attributes(name:"Electronica")
Genre::Translation.find_by_id(24).update_attributes(name:"Classic")
Genre::Translation.find_by_id(25).update_attributes(name:"Jazz")
Genre::Translation.find_by_id(26).update_attributes(name:"World Music")
Genre::Translation.find_by_id(27).update_attributes(name:"Academic")
Genre::Translation.find_by_id(28).update_attributes(name:"Instrumental Fusion")