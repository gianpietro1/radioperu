I18n.locale = "es"

User.create!([
  {email: "admin@example.com", password: "helloworld", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-05-29 17:13:57", last_sign_in_at: "2015-05-29 17:13:57", current_sign_in_ip: "::1", last_sign_in_ip: "::1", confirmation_token: nil, confirmed_at: "2015-05-29 17:13:31", confirmation_sent_at: nil, unconfirmed_email: nil, name: "Admin User", username: nil, role: 'admin'}
])

Radio.create([
  {player: "http://player.radiocdn.com/iframe.js?hash=b1186bab4c3575dae59ba0cb42ba4a06abc52cf3-118-41", host: "stereo.wavestreamer.com", port: 3556},
  {player: "http://player.radiocdn.com/iframe.js?hash=de2fa7aa3279d4bef0ae03010d0b3a0fba32c926-118-41", host: "knight.wavestreamer.com", port: 9478},
  {player: "http://player.radiocdn.com/iframe.js?hash=4d6c75a8560f4960f5b5488cb73137151af78a1e-118-41", host: "majestic.wavestreamer.com", port: 2146},
  {player: "http://player.radiocdn.com/iframe.js?hash=5fd8f059ce3ed62bb42b0a1ba74a09c5245c2c1e-118-41", host: "knight.wavestreamer.com", port: 9214},
  {player: "http://player.radiocdn.com/iframe.js?hash=61346ceae3b02d00ec378fb796565f0990eadc55-118-41", host: "smoke.wavestreamer.com", port: 9781}
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
Radio.find_by_id(4).genres.create(name:"Reggaetón")
Radio.find_by_id(4).genres.create(name:"Pop Urbano")
Radio.find_by_id(4).genres.create(name:"Latin Pop")
Radio.find_by_id(3).genres.create(name:"Bugalú")

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
Genre.find_by_id(30).set_translations(:en => { :name => 'Reggaeton' }, :es => { :name => 'Reggaetón'})
Genre.find_by_id(31).set_translations(:en => { :name => 'Urban Pop' }, :es => { :name => 'Pop Urbano'})
Genre.find_by_id(32).set_translations(:en => { :name => 'Latin Pop' }, :es => { :name => 'Latin Pop'})
Genre.find_by_id(33).set_translations(:en => { :name => 'Boogaloo' }, :es => { :name => 'Bugalú'})

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
Genre.find_by_id(30).set_translations(:en => { :name => 'Reggaeton' }, :es => { :name => 'Reggaetón'})
Genre.find_by_id(31).set_translations(:en => { :name => 'Urban Pop' }, :es => { :name => 'Pop Urbano'})
Genre.find_by_id(32).set_translations(:en => { :name => 'Latin Pop' }, :es => { :name => 'Latin Pop'})
Genre.find_by_id(33).set_translations(:en => { :name => 'Boogaloo' }, :es => { :name => 'Bugalú'})

I18n.locale = "es"
Format.create(name:"CD")
Format.create(name:"Digital")
Format.create(name:"Vinilo")
Format.create(name:"Cassette")
Format.create(name:"Desconocido")

I18n.locale = "en"
Format.find_by_id(1).update_attributes(name:"CD")
Format.find_by_id(2).update_attributes(name:"Vinyl")
Format.find_by_id(3).update_attributes(name:"Cassette")
Format.find_by_id(4).update_attributes(name:"Unknown")
Format.find_by_id(4).update_attributes(name:"Digital")

I18n.locale = "es"

Program.create(name: "Ritmos Negros del Perú", description: "Una muestra de nuestra cultura afroperuana a través de su música, distinguida por una percusión única.", radio_id: 1, program_start: "08:00", program_end: "09:59", days_array: "1,2,3,4,5,6,7")
Program.create(name: "Ritmos Negros del Perú", description: "Una muestra de nuestra cultura afroperuana a través de su música, distinguida por una percusión única.", radio_id: 1, program_start: "20:00", program_end: "20:59", days_array: "1,2,3,4,5,6,7")
Program.create(name: "Canción de Autor", description: "Cantautores peruanos en su máxima expresión.", radio_id: 1, program_start: "10:00", program_end: "10:59", days_array: "1,2,3,4,5,6,7")
Program.create(name: "Canción de Autor", description: "Cantautores peruanos en su máxima expresión.", radio_id: 1, program_start: "16:00", program_end: "16:59", days_array: "1,2,3,4,5,6,7")
Program.create(name: "Canción de Autor", description: "Cantautores peruanos en su máxima expresión.", radio_id: 1, program_start: "22:00", program_end: "22:59", days_array: "1,2,3,4,5,6,7")
Program.create(name: "Alma Criolla", description: "Criollismo puro y de todo el Perú.", radio_id: 1, program_start: "14:00", program_end: "15:59", days_array: "1,2,3,4,5,6,7")
Program.create(name: "Alma Criolla", description: "Criollismo puro y de todo el Perú.", radio_id: 1, program_start: "21:00", program_end: "21:59", days_array: "1,2,3,4,5,6,7")
Program.create(name: "Varios de la Costa", description: "Música criolla y ritmos negros unidos.", radio_id: 1, program_start: "11:00", program_end: "13:59", days_array: "1,2,3,4,5,6,7")
Program.create(name: "Varios de la Costa", description: "Música criolla y ritmos negros unidos.", radio_id: 1, program_start: "17:00", program_end: "19:59", days_array: "1,2,3,4,5,6,7")
Program.create(name: "Varios de la Costa", description: "Música criolla y ritmos negros unidos.", radio_id: 1, program_start: "23:00", program_end: "07:59", days_array: "1,2,3,4,5,6,7")

Program.create(name: "Varios del Ande", description: "Música andina del Perú.", radio_id: 2, program_start: "08:00", program_end: "09:59", days_array: "1,2,3,4,5,6,7")
Program.create(name: "Varios del Ande", description: "Música andina del Perú.", radio_id: 2, program_start: "11:00", program_end: "14:59", days_array: "1,2,3,4,5,6,7")
Program.create(name: "Varios del Ande", description: "Música andina del Perú.", radio_id: 2, program_start: "16:00", program_end: "19:59", days_array: "1,2,3,4,5,6,7")
Program.create(name: "Varios del Ande", description: "Música andina del Perú.", radio_id: 2, program_start: "21:00", program_end: "07:59", days_array: "1,2,3,4,5,6,7")
Program.create(name: "Arequipay", description: "Música andina del departamento de Arequipa.", radio_id: 2, program_start: "10:00", program_end: "10:59", days_array: "1,2,3,4,5,6,7")
Program.create(name: "Arequipay", description: "Música andina del departamento de Arequipa.", radio_id: 2, program_start: "15:00", program_end: "15:59", days_array: "1,2,3,4,5,6,7")
Program.create(name: "Arequipay", description: "Música andina del departamento de Arequipa.", radio_id: 2, program_start: "20:00", program_end: "20:59", days_array: "1,2,3,4,5,6,7")

Program.create(name: "Varios de la Música Tropical", description: "Salsa, Cumbia, Chicha, Boogaloo y más ritmos tropicales.", radio_id: 3, program_start: "23:00", program_end: "10:59", days_array: "1,2,3,4,5,6,7")
Program.create(name: "Varios de la Música Tropical", description: "Salsa, Cumbia, Chicha, Boogaloo y más ritmos tropicales.", radio_id: 3, program_start: "14:00", program_end: "19:59", days_array: "1,2,3,4,5,6,7")
Program.create(name: "Cumbia de Ayer y Hoy", description: "Cumbia de todos los tiempos.", radio_id: 3, program_start: "11:00", program_end: "12:59", days_array: "1,2,3,4,5,6,7")
Program.create(name: "Cumbia de Ayer y Hoy", description: "Cumbia de todos los tiempos.", radio_id: 3, program_start: "20:00", program_end: "21:59", days_array: "1,2,3,4,5,6,7")
Program.create(name: "Salsa de Ayer y Hoy", description: "Salsa de todos los tiempos.", radio_id: 3, program_start: "13:00", program_end: "13:59", days_array: "1,2,3,4,5,6,7")
Program.create(name: "Salsa de Ayer y Hoy", description: "Salsa de todos los tiempos.", radio_id: 3, program_start: "22:00", program_end: "22:59", days_array: "1,2,3,4,5,6,7")

Program.create(name: "Tiempo de Reggae", description: "Sólo Reggae.", radio_id: 4, program_start: "08:00", program_end: "08:59", days_array: "1,2,3,4,5,6,7")
Program.create(name: "Tiempo de Reggae", description: "Sólo Reggae.", radio_id: 4, program_start: "19:00", program_end: "19:59", days_array: "1,2,3,4,5,6,7")
Program.create(name: "RockOla de Antaño", description: "Rock, Nueva Ola y ritmos psicodélicos de los 60s y 70s.", radio_id: 4, program_start: "09:00", program_end: "10:59", days_array: "1,2,3,4,5,6,7")
Program.create(name: "RockOla de Antaño", description: "Rock, Nueva Ola y ritmos psicodélicos de los 60s y 70s.", radio_id: 4, program_start: "20:00", program_end: "20:59", days_array: "1,2,3,4,5,6,7")
Program.create(name: "Fusiones Imperdibles", description: "Fusiones de todos los tiempos: rock y ritmos peruanos!", radio_id: 4, program_start: "11:00", program_end: "12:59", days_array: "1,2,3,4,5,6,7")
Program.create(name: "Fusiones Imperdibles", description: "Fusiones de todos los tiempos: rock y ritmos peruanos!", radio_id: 4, program_start: "21:00", program_end: "21:59", days_array: "1,2,3,4,5,6,7")
Program.create(name: "SkaFunk", description: "Ska y Funk de todos los tiempos.", radio_id: 4, program_start: "13:00", program_end: "13:59", days_array: "1,2,3,4,5,6,7")
Program.create(name: "SkaFunk", description: "Ska y Funk de todos los tiempos.", radio_id: 4, program_start: "22:00", program_end: "22:59", days_array: "1,2,3,4,5,6,7")
Program.create(name: "Hard Rock & Punk", description: "Rock y Punk del duro.", radio_id: 4, program_start: "14:00", program_end: "14:59", days_array: "1,2,3,4,5,6,7")
Program.create(name: "Hard Rock & Punk", description: "Rock y Punk del duro.", radio_id: 4, program_start: "23:00", program_end: "00:59", days_array: "1,2,3,4,5,6,7")
Program.create(name: "Rocas, Popas y Otras", description: "Rock, Pop, Funk, Hip-Hop y más!", radio_id: 4, program_start: "15:00", program_end: "18:59", days_array: "1,2,3,4,5,6,7")
Program.create(name: "Rocas, Popas y Otras", description: "Rock, Pop, Funk, Hip-Hop y más!", radio_id: 4, program_start: "01:00", program_end: "07:59", days_array: "1,2,3,4,5,6,7")

Program.create(name: "Varios del Jazz y Fusión Instrumental", description: "Jazz y fusiones instrumentales de todos los tiempos.", radio_id: 5, program_start: "22:00", program_end: "08:59", days_array: "1,2,3,4,5,6,7")
Program.create(name: "Varios del Jazz y Fusión Instrumental", description: "Jazz y fusiones instrumentales de todos los tiempos.", radio_id: 5, program_start: "10:00", program_end: "17:59", days_array: "1,2,3,4,5,6,7")
Program.create(name: "Varios del Jazz y Fusión Instrumental", description: "Jazz y fusiones instrumentales de todos los tiempos.", radio_id: 5, program_start: "19:00", program_end: "20:59", days_array: "1,2,3,4,5,6,7")
Program.create(name: "Electronica", description: "Música electrónica, en su mayoría no fusionada.", radio_id: 5, program_start: "09:00", program_end: "09:59", days_array: "1,2,3,4,5,6,7")
Program.create(name: "Electronica", description: "Música electrónica, en su mayoría no fusionada.", radio_id: 5, program_start: "21:00", program_end: "21:59", days_array: "1,2,3,4,5,6,7")
Program.create(name: "Música Académica", description: "Música académica y de investigación", radio_id: 5, program_start: "18:00", program_end: "18:59", days_array: "1,2,3,4,5,6,7")


I18n.locale = "en"

Program.find(1).update_attributes(name:"Black Rythms of Perú", description: "A sign of our Afro-Peruvian culture through its music, distinguished by its unique percussion.")
Program.find(2).update_attributes(name:"Black Rythms of Perú", description: "A sign of our Afro-Peruvian culture through its music, distinguished by its unique percussion.")
Program.find(3).update_attributes(name:"Singer/Songwriters", description: "Peruvian singer/songwriters at their best.")
Program.find(4).update_attributes(name:"Singer/Songwriters", description: "Peruvian singer/songwriters at their best.")
Program.find(5).update_attributes(name:"Singer/Songwriters", description: "Peruvian singer/songwriters at their best.")
Program.find(6).update_attributes(name:"Creole Soul", description: "Puro Creole music and from all regions.")
Program.find(7).update_attributes(name:"Creole Soul", description: "Puro Creole music and from all regions.")
Program.find(8).update_attributes(name:"Various from the Coast", description: "Creole music and black rhythms together.")
Program.find(9).update_attributes(name:"Various from the Coast", description: "Creole music and black rhythms together.")
Program.find(10).update_attributes(name:"Various from the Coast", description: "Creole music and black rhythms together.")

Program.find(11).update_attributes(name:"Various from the Andes", description: "Andean music fron Peru.")
Program.find(12).update_attributes(name:"Various from the Andes", description: "Andean music fron Peru.")
Program.find(13).update_attributes(name:"Various from the Andes", description: "Andean music fron Peru.")
Program.find(14).update_attributes(name:"Various from the Andes", description: "Andean music fron Peru.")
Program.find(15).update_attributes(name:"Arequipay", description: "Andean music from de Arequipa department.")
Program.find(16).update_attributes(name:"Arequipay", description: "Andean music from de Arequipa department.")
Program.find(17).update_attributes(name:"Arequipay", description: "Andean music from de Arequipa department.")

Program.find(18).update_attributes(name:"Various from Tropical Music", description: "Salsa, Cumbia, Chicha, Boogaloo and more tropical rythms.")
Program.find(19).update_attributes(name:"Various from Tropical Music", description: "Salsa, Cumbia, Chicha, Boogaloo and more tropical rythms.")
Program.find(20).update_attributes(name:"Cumbia from All Times", description: "Cumbia from all times.")
Program.find(21).update_attributes(name:"Cumbia from All Times", description: "Cumbia from all times.")
Program.find(22).update_attributes(name:"Salsa from All Times", description: "Salsa from all times.")
Program.find(23).update_attributes(name:"Salsa from All Times", description: "Salsa from all times.")

Program.find(24).update_attributes(name:"Time for Reggae", description: "Only reggae music.")
Program.find(25).update_attributes(name:"Time for Reggae", description: "Only reggae music.")
Program.find(26).update_attributes(name:"RockOla from Yesteryear", description: "Rock, Nueva Ola & psychedelic rythms from the 60s & 70s.")
Program.find(27).update_attributes(name:"RockOla from Yesteryear", description: "Rock, Nueva Ola & psychedelic rythms from the 60s & 70s.")
Program.find(28).update_attributes(name:"Must-hear Fusions", description: "Fusion music from all times: rock & peruvian rythms!")
Program.find(29).update_attributes(name:"Must-hear Fusions", description: "Fusion music from all times: rock & peruvian rythms!")
Program.find(30).update_attributes(name:"SkaFunk", description: "Ska & Funk from all times.")
Program.find(31).update_attributes(name:"SkaFunk", description: "Ska & Funk from all times.")
Program.find(32).update_attributes(name:"Hard Rock & Punk", description: "Hard Rock & Punk music.")
Program.find(33).update_attributes(name:"Hard Rock & Punk", description: "Hard Rock & Punk music.")
Program.find(34).update_attributes(name:"Rocks, Pops & More", description: "Rock, Pop, Funk, Hip-Hop & more!")
Program.find(35).update_attributes(name:"Rocks, Pops & More", description: "Rock, Pop, Funk, Hip-Hop & more!")

Program.find(36).update_attributes(name:"Various from Jazz & Instrumental Fusion", description: "Jazz and Instrumental fusion from all times.")
Program.find(37).update_attributes(name:"Various from Jazz & Instrumental Fusion", description: "Jazz and Instrumental fusion from all times.")
Program.find(38).update_attributes(name:"Various from Jazz & Instrumental Fusion", description: "Jazz and Instrumental fusion from all times.")
Program.find(39).update_attributes(name:"Electronica", description: "Electronica music, mostly not fused.")
Program.find(40).update_attributes(name:"Electronica", description: "Electronica music, mostly not fused.")
Program.find(41).update_attributes(name:"Academic Music", description: "Academic & investigation works.")

# NEW RADIOS

radios = 
     [
  {
    id: 1,
    listenurl: "http://radioperu.pe:8000/radio1",
    color: "ECB85B",
    name: "Estación 1",
    description: "costeña y canción"
  },
  {
    id: 2,
    listenurl: "http://radioperu.pe:8000/radio2",
    color: "C05B69",
    name: "Estación 2",
    description: "andina"
  },
  {
    id: 3,
    listenurl: "http://radioperu.pe:8000/radio3",
    color: "81BB7E",
    name: "Estación 3",
    description: "tropical"
  },
  {
    id: 4,
    listenurl: "http://radioperu.pe:8000/radio4",
    color: "F7764D",
    name: "Estación 4",
    description: "rock, pop y afines"
  },
  {
    id: 5,
    listenurl: "http://radioperu.pe:8000/radio5",   
    color: "93D3D7",
    name: "Estación 5",
    description: "jazz, instrumental y afines"
  }
]

radios.each do |radio|
  Station.create(radio)
end

Station.find_by_id(1).set_translations(:en => { :name => 'Station 1', :description => 'coast & folk' }, :es => { :name => 'Estación 1', :description => 'costeña y canción'} )
Station.find_by_id(2).set_translations(:en => { :name => 'Station 2', :description => 'andean' }, :es => { :name => 'Estación 2', :description => 'andina'} )
Station.find_by_id(3).set_translations(:en => { :name => 'Station 3', :description => 'tropical' }, :es => { :name => 'Estación 3', :description => 'tropical'} )
Station.find_by_id(4).set_translations(:en => { :name => 'Station 4', :description => 'rock, pop & related' }, :es => { :name => 'Estación 4', :description => 'rock, pop y afines'} )
Station.find_by_id(5).set_translations(:en => { :name => 'Station 5', :description => 'jazz & instrumental & related' }, :es => { :name => 'Estación 5', :description => 'jazz, instrumental y afines'} )
