class Usercontrol

  def self.createall(email,password,name,artist)
    user = User.create!(
      email: email, password: password, reset_password_token: nil, 
        reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, 
        current_sign_in_at: Time.now, last_sign_in_at: Time.now, 
        current_sign_in_ip: "::1", last_sign_in_ip: "::1", confirmation_token: nil, 
        confirmed_at: Time.now, confirmation_sent_at: nil, unconfirmed_email: nil, 
        name: name, username: nil, role: 'musician'
    )

    Artist.create!(
      name: artist,
      user_id: user.id
      )

  end

  def self.createuser(email,password,name,artist)

    user = User.create!(
      email: email, password: password, reset_password_token: nil, 
        reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, 
        current_sign_in_at: Time.now, last_sign_in_at: Time.now, 
        current_sign_in_ip: "::1", last_sign_in_ip: "::1", confirmation_token: nil, 
        confirmed_at: Time.now, confirmation_sent_at: nil, unconfirmed_email: nil, 
        name: name, username: nil, role: 'musician'
    )

    Artist.find_by(name: artist).update_attributes(user_id: user.id)

  end

  def self.createartist(email,artist)

    user = User.find_by(email: email)

    Artist.create!(
      name: artist,
      user_id: user.id
      )

  end

end