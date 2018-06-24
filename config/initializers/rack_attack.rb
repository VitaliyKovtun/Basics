class Rack::Attack
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

  # Always allow requests from localhost
  safelist('allow from localhost') do |req|
    # Requests are allowed if the return value is truthy
    req.ip == '127.0.0.1' || req.ip == '::1'
  end

  # Block logins from a bad user agent
  blocklist('block bad UA logins') do |req|
    req.path == '/users/sign_in' && req.post? && req.user_agent == 'BadUA'
  end

  # Throttle requests to 5 requests per second per ip
  # If the return value is truthy, the cache key for the return value
  # is incremented and compared with the limit. In this case:
  #   "rack::attack:#{Time.now.to_i/1.second}:req/ip:#{req.ip}"
  # If falsy, the cache key is neither incremented nor checked.
  throttle('req/ip', limit: 5, period: 1.second, &:ip)

  self.blocklisted_response = lambda do |_env|
    # Using 503 because it may make attacker think that they have successfully
    # DOSed the site. Rack::Attack returns 403 for blocklists by default
    [503, {}, ['Blocked']]
  end

  self.throttled_response = lambda do |_env|
    # NB: you have access to the name and other data about the matched throttle
    #  env['rack.attack.matched'],
    #  env['rack.attack.match_type'],
    #  env['rack.attack.match_data']

    # Using 503 because it may make attacker think that they have successfully
    # DOSed the site. Rack::Attack returns 429 for throttling by default
    [503, {}, ["Server Error\n"]]
  end
end
