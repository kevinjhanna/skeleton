# encoding: UTF-8

require_relative "shotgun" unless defined?(::Shotgun)

class Cuba
  plugin Cuba::Render
  use Rack::Session::Cookie
  use Rack::Protection
  use Rack::Protection::RemoteReferrer

  use Rack::Static,
    root: "public",
    urls: ["/js", "/css", "/images"]
end

Cuba.define do
  on get do
    on root do
      res.write(view("home"))
    end
  end
end
