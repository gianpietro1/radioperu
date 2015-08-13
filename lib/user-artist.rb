User.create!(
  email: "mafer@capitansimio.com", password: "mafer123", reset_password_token: nil, 
    reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, 
    current_sign_in_at: Time.now, last_sign_in_at: Time.now, 
    current_sign_in_ip: "::1", last_sign_in_ip: "::1", confirmation_token: nil, 
    confirmed_at: Time.now, confirmation_sent_at: nil, unconfirmed_email: nil, 
    name: "Maria Fernanda", username: nil, role: 'musician'
)

user = User.find_by(email: "mafer@capitansimio.com").id

Artist.create!(
  name: "Alejandro y Maria Laura",
  user_id: user
  )

Artist.create!(
  name: "Wolves as Friends",
  user_id: user
  )
