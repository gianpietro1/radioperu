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
