class Usercontrol

  def self.create(email,password,name,artist)
    User.create!(
      email: email, password: password, reset_password_token: nil, 
        reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, 
        current_sign_in_at: Time.now, last_sign_in_at: Time.now, 
        current_sign_in_ip: "::1", last_sign_in_ip: "::1", confirmation_token: nil, 
        confirmed_at: Time.now, confirmation_sent_at: nil, unconfirmed_email: nil, 
        name: name, username: nil, role: 'musician'
    )

    user = User.find_by(email: email).id

    Artist.create!(
      name: artist,
      user_id: user
      )

  end

  def self.assign(email,artist)

    user = User.find_by(email: email).id

    Artist.create!(
      name: artist,
      user_id: user
      )

  end

end