if Rails.env.development? || Rails.env.test?
 $redis = Redis.new(:host => 'localhost', :port => 6379)
elsif Rails.env.production?
 #$redis = Redis.new(:host => 'scat.redistogo.com', :port => 10384, :password => ENV['REDISTOGO_PASSWORD'])
end