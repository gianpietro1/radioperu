# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Radios

Radio.create(name: 'Estación 1', description: 'costeña y canción', player: "http://player.radiocdn.com/iframe.js?hash=5e6ead35300119bc5234f1800b455a948ddedf3d-450-135", host: "eclipse.wavestreaming.com", port: 3771)
Radio.create(name: 'Estación 2', description: 'andina', player: "http://player.radiocdn.com/iframe.js?hash=5e6ead35300119bc5234f1800b455a948ddedf3d-450-135", host: "eclipse.wavestreaming.com", port: 3771)
Radio.create(name: 'Estación 3', description: 'tropical', player: "http://player.radiocdn.com/iframe.js?hash=5e6ead35300119bc5234f1800b455a948ddedf3d-450-135", host: "eclipse.wavestreaming.com", port: 3771)
Radio.create(name: 'Estación 4', description: 'rock, pop y afines', player: "http://player.radiocdn.com/iframe.js?hash=5e6ead35300119bc5234f1800b455a948ddedf3d-450-135", host: "eclipse.wavestreaming.com", port: 3771)
Radio.create(name: 'Estación 5', description: 'instrumental', player: "http://player.radiocdn.com/iframe.js?hash=5e6ead35300119bc5234f1800b455a948ddedf3d-450-135", host: "eclipse.wavestreaming.com", port: 3771)

Radio.find_by(id: 1).update_attributes(name: 'station 1', description: 'coast & folk', locale: :en)
Radio.find_by(id: 2).update_attributes(name: 'station 2', description: 'andean', locale: :en)
Radio.find_by(id: 3).update_attributes(name: 'station 3', description: 'tropical', locale: :en)
Radio.find_by(id: 4).update_attributes(name: 'station 4', description: 'rock, pop & related', locale: :en)
Radio.find_by(id: 5).update_attributes(name: 'station 5', description: 'instrumental', locale: :en)

# Admin user

admin = User.new(
  name: 'Admin User',
  email: 'admin@example.com',
  password: 'helloworld',
)
admin.skip_confirmation!
admin.save!
