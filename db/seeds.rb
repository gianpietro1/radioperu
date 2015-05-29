User.create!([
  {email: "admin@example.com", encrypted_password: "$2a$10$5k2I8dEz.oqw/aIrnx4UBOeSgLE0REvQ1328W48lo2A9kro2Y8g6i", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-05-29 17:13:57", last_sign_in_at: "2015-05-29 17:13:57", current_sign_in_ip: "::1", last_sign_in_ip: "::1", confirmation_token: nil, confirmed_at: "2015-05-29 17:13:31", confirmation_sent_at: nil, unconfirmed_email: nil, name: "Admin User", username: nil}
])
Album.create!([
  {name: "Reconocer", year: 2012, cover: "reconocer.jpeg", artist_id: 1, review: "\"Reconocer\" fue un disco nominado al Grammy Latino 2012 como \"Mejor Álbum Pop Contemporaneo\", mérito obtenido hace unos años atras con otro disco. Pamela nos pinta un ambiente melódico fresco con temas como \"Mantra\", \"Ligera Love\", entre otros.", format: "CD"},
  {name: "Perú Blue", year: 2010, cover: "perublue.jpg", artist_id: 1, review: "Segundo álbum de Pamela.", format: "CD"},
  {name: "Técnicas para olvidar", year: 1993, cover: "PedroSuarezVertiz-NoExistenTecnicasParaOlvidar.jpg", artist_id: 2, review: "(No Existen) Técnicas para Olvidar es el primer disco como solista de Pedro Suárez-Vértiz, lanzado en 1993.", format: "CD"}
])
Artist.create!([
  {name: "Pamela Rodríguez", image: "pamela_rodriguez.jpg", city: "Lima", url: "http://lamusicadepamela.com", active: true, bio: "Nació en Lima, Perú. Es descendiente de diversas culturas: abuelo mestizo (hijo de español con indígena peruana), con abuela napolitana; abuelo italiano con abuela boliviano-inglesa.\r\nEscribe poemas, toca el piano y pinta desde los 9 años. Guarda registros de sus creaciones desde esa época.  Vivió en Canadá durante dos años de su niñez, en los que cantó en varios coros locales.\r\nCuando regresó a Lima con su familia estudió música y arte. A los 14 años, gracias a su papá (músico y productor), empezó a grabar en estudios. Más tarde tuvo clases particulares de canto con Mariela Monzón y de música con Pelo Madueño.\r\nEstudió música y etnomusicología durante cuatro años en la Universidad de North Texas. Pamela ha seguido estudiando con profesores de forma particular y también como autodidacta.\r\nPamela está casada con el economista y escritor español Raúl Baltar Estévez,con quien tiene una hija."},
  {name: "Pedro Suárez-Vertiz", image: "pedrosuarezvertiz.jpeg", city: "Lima", url: "http://www.pedrosuarez-vertiz.com", active: true, bio: "Hijo de Hernando Suárez-Vértiz (hijo del pintor salvador Suárez-Vértiz),1 nació el 13 de febrero de 1969, en el Hospital Naval del Callao, esto debido a que su madre y abuelo materno pertenecieron a la Marina de Guerra del Perú. Es hermano mayor del también músico Patricio Suárez-Vértiz. Pasó toda su infancia y adolescencia en San Isidro, frente al parque El Olivar.\r\nA los 1 años, Pedro alineaba los adornos de su casa como un xilófono y los golpeaba con una varita para sacarles melodías. Su padre le compró inmediatamente una vieja celesta Dulcitone, su primer instrumento musical. Recién luego de varios años se le pudo comprar un piano.\r\nA los 9 años en el Colegio María Reina, compuso por el Día de la Madre un relato sobre las reflexiones sobre el nacer. Ya en secundaria sus escritos empezaron a ser musicalizados al formar una primera banda con su hermano y amigos llamada Paranoia.2 Posteriormente, formó el grupo Arena Hash, en el cual tocaba la guitarra, componía y cantaba todas las canciones.\r\nParalelamente a su carrera musical con Arena Hash, ingresó a la Universidad de Lima y eligió la carrera de Ciencias de la Comunicación, la cual culminó con una extensa tesis sobre el fenómeno del liderazgo, graduándose a los 21 años en la especialidad de radio, cine y televisión."}
])
Radio.create!([
  {player: "http://player.radiocdn.com/iframe.js?hash=5e6ead35300119bc5234f1800b455a948ddedf3d-450-135", host: "eclipse.wavestreaming.com", port: 3771, name: "Estación 1", description: "costeña y canción"},
  {player: "http://player.radiocdn.com/iframe.js?hash=5e6ead35300119bc5234f1800b455a948ddedf3d-450-135", host: "eclipse.wavestreaming.com", port: 3771, name: "Estación 2", description: "andina"},
  {player: "http://player.radiocdn.com/iframe.js?hash=5e6ead35300119bc5234f1800b455a948ddedf3d-450-135", host: "eclipse.wavestreaming.com", port: 3771, name: "Estación 3", description: "tropical"},
  {player: "http://player.radiocdn.com/iframe.js?hash=5e6ead35300119bc5234f1800b455a948ddedf3d-450-135", host: "eclipse.wavestreaming.com", port: 3771, name: "Estación 4", description: "rock, pop y afines"},
  {player: "http://player.radiocdn.com/iframe.js?hash=5e6ead35300119bc5234f1800b455a948ddedf3d-450-135", host: "eclipse.wavestreaming.com", port: 3771, name: "Estación 5", description: "instrumental"}
])
Song.create!([
  {album_id: 1, discnum: 1, track: 6, name: "Lejos", filename: "06_Lejos.mp3", length: "", lyrics: nil, video: nil, review: nil},
  {album_id: 1, discnum: 1, track: 2, name: "Orgánica", filename: "02_Organica.mp3", length: "", lyrics: nil, video: nil, review: nil},
  {album_id: 2, discnum: 1, track: 7, name: "No miento", filename: "07_No_miento.mp3", length: "", lyrics: nil, video: nil, review: nil},
  {album_id: 1, discnum: 1, track: 7, name: "Pequeña Diosa (Luana)", filename: "07_Peque_a_Diosa__Luana_.mp3", length: "", lyrics: nil, video: nil, review: nil},
  {album_id: 1, discnum: 1, track: 9, name: "El Alma y el Arnés", filename: "09_El_alma_y_el_Arnes.mp3", length: "", lyrics: nil, video: nil, review: nil},
  {album_id: 3, discnum: 1, track: 2, name: "Cuéntame", filename: "02_Cuentame.mp3", length: "", lyrics: nil, video: nil, review: nil},
  {album_id: 3, discnum: 1, track: 8, name: "No pensé que era amor", filename: "08_No_pense_que_era_amor.mp3", length: "", lyrics: nil, video: nil, review: nil}
])
Album::Translation.create!([
  {album_id: 1, locale: "es", review: "\"Reconocer\" fue un disco nominado al Grammy Latino 2012 como \"Mejor Álbum Pop Contemporaneo\", mérito obtenido hace unos años atras con otro disco. Pamela nos pinta un ambiente melódico fresco con temas como \"Mantra\", \"Ligera Love\", entre otros.", format: "CD"},
  {album_id: 2, locale: "en", review: "Second album from Pamela", format: "CD"},
  {album_id: 2, locale: "es", review: "Segundo álbum de Pamela.", format: "CD"},
  {album_id: 3, locale: "es", review: "(No Existen) Técnicas para Olvidar es el primer disco como solista de Pedro Suárez-Vértiz, lanzado en 1993.", format: "CD"}
])
Artist::Translation.create!([
  {artist_id: 1, locale: "es", bio: "Nació en Lima, Perú. Es descendiente de diversas culturas: abuelo mestizo (hijo de español con indígena peruana), con abuela napolitana; abuelo italiano con abuela boliviano-inglesa.\r\nEscribe poemas, toca el piano y pinta desde los 9 años. Guarda registros de sus creaciones desde esa época.  Vivió en Canadá durante dos años de su niñez, en los que cantó en varios coros locales.\r\nCuando regresó a Lima con su familia estudió música y arte. A los 14 años, gracias a su papá (músico y productor), empezó a grabar en estudios. Más tarde tuvo clases particulares de canto con Mariela Monzón y de música con Pelo Madueño.\r\nEstudió música y etnomusicología durante cuatro años en la Universidad de North Texas. Pamela ha seguido estudiando con profesores de forma particular y también como autodidacta.\r\nPamela está casada con el economista y escritor español Raúl Baltar Estévez,con quien tiene una hija."},
  {artist_id: 1, locale: "en", bio: "Pamela Rodriguez is a latin grammy nominated artist, who is exploring the cross-cultural musical languages within her home city Lima, Peru. She records with the award winning and three time Grammy Nominee producer Greg Landau and together work to find a modern homogeneous sound and a connecting thread to her music that contains a wide range of styles such as landó, festejo, Peruvian waltz, zamacueca, the Peruvian jungle’s cumbia, indie rock and reggae.\r\n\r\nHer first album Peru Blue explored the new arrangements of Peruvian classics like Augusto Polo Campos´ “Cuando llora mi guitarra” and Chabuca Granda’s “Cardo o Ceniza”, next to her own compositions. Rodriguez is a middle class, European-Peruvian based in the capital city, which has brought a discussion within Peru of appropriation (and profiting) by an outsider of the coastal African-Peruvian tradition. Being a Peruvian folk composer is quite an achievement since most singers and musicians in the Afro-Peruvian genre tend to sing the same songs from the Afro-Peruvian songbook. “Peru Blue” was also controversial since she decided to sing a Jazz Ballad written by her (“silent tears”) in a Peruvian folk production scheme."},
  {artist_id: 2, locale: "es", bio: "Hijo de Hernando Suárez-Vértiz (hijo del pintor salvador Suárez-Vértiz),1 nació el 13 de febrero de 1969, en el Hospital Naval del Callao, esto debido a que su madre y abuelo materno pertenecieron a la Marina de Guerra del Perú. Es hermano mayor del también músico Patricio Suárez-Vértiz. Pasó toda su infancia y adolescencia en San Isidro, frente al parque El Olivar.\r\nA los 1 años, Pedro alineaba los adornos de su casa como un xilófono y los golpeaba con una varita para sacarles melodías. Su padre le compró inmediatamente una vieja celesta Dulcitone, su primer instrumento musical. Recién luego de varios años se le pudo comprar un piano.\r\nA los 9 años en el Colegio María Reina, compuso por el Día de la Madre un relato sobre las reflexiones sobre el nacer. Ya en secundaria sus escritos empezaron a ser musicalizados al formar una primera banda con su hermano y amigos llamada Paranoia.2 Posteriormente, formó el grupo Arena Hash, en el cual tocaba la guitarra, componía y cantaba todas las canciones.\r\nParalelamente a su carrera musical con Arena Hash, ingresó a la Universidad de Lima y eligió la carrera de Ciencias de la Comunicación, la cual culminó con una extensa tesis sobre el fenómeno del liderazgo, graduándose a los 21 años en la especialidad de radio, cine y televisión."}
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
