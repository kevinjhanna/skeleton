# encoding: UTF-8

require File.expand_path("shotgun",  File.dirname(__FILE__))
require File.expand_path("settings", File.dirname(__FILE__))

# Configure your default settings in env.sh
Malone.connect(url: Settings::MALONE_URL)
Ohm.connect(url: Settings::REDIS_URL)

class Cuba
  plugin Cuba::Render
  use Rack::Session::Cookie
  use Rack::Protection
  use Rack::Protection::RemoteReferrer

  use Rack::Static,
    root: "public",
    urls: ["/js", "/css", "/images"]
end


def session
  env["rack.session"]
end

Cuba.define do
  on get do
    on root do
      res.write(view("home"))
    end
  end
end
