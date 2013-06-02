module Settings
  File.read("env.sh").scan(/(.*?)="?(.*)"?$/).each do |key, value|
    ENV[key] ||= value
  end

  REDIS_URL   = ENV["REDIS_URL"]
  MALONE_URL  = ENV["MALONE_URL"]
  HOST        = ENV["APP_HOST"]
end
