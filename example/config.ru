require "roda"
require "roda-papercraft"

class App < Roda
  plugin :papercraft

  route do |r|
    r.get "hello" do
      render {
        h1 "Hello from Papercraft"
      }
    end

    r.get "greet", String do |name|
      template("greet").render(name)
    end
  end
end

run App
