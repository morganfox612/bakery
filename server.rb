require "sinatra"
require "httparty"
require "./mailer.rb"

app_key = 'M2X4WR735AODNYMJ6C4W'
$req = HTTParty.get("https://www.eventbriteapi.com/v3/events/search/?q=baking&token=#{app_key}")

def subscribe_email(recipient)
  Newsletter.subscribe(recipient).deliver_now
end

class Cookies
  attr_accessor :cookie_name, :cookie_price, :cookie_description
  def initialize(cookie_name, cookie_price, cookie_description)
    @cookie_name = cookie_name
    @cookie_price = cookie_price
    @cookie_description = cookie_description
  end
end

class Cakes
  attr_accessor :cake_name, :cake_price, :cake_description
  def initialize(cake_name, cake_price, cake_description)
    @cake_name = cake_name
    @cake_price = cake_price
    @cake_description = cake_description
  end
end

class Muffins
  attr_accessor :muffin_name, :muffin_price, :muffin_description
  def initialize(muffin_name, muffin_price, muffin_description)
    @muffin_name = muffin_name
    @muffin_price = muffin_price
    @muffin_description = muffin_description
  end
end


get '/' do
  erb :home
end

get '/cakes' do
  $cake1 = Cakes.new("Vanilla", "$6.00", "Classic Vanilla Cake with Buttercream Frosting")
  $cake2 = Cakes.new("Chocolate", "$6.00", "Chocolate Cake with Chocolate Frosting")
  $cake3 = Cakes.new("Oreo", "$7.50", "Oreo Cake with Icing on Top")
  $cake4 = Cakes.new("Strawberry", "$6.00", "Strawberry Cake with Whipped-Cream Frosting")
  $cake5 = Cakes.new("Strawberry Cheesecake", "$7.50", "Strawberry Cheesecake with Glazed Strawberries")
  $cake6 = Cakes.new("Lemon", "$6.00", "Lemon Cake with Lemon Frosting")
  erb :cakes
end

get '/cookies' do
  $cookie1 = Cookies.new("Smores", "$4.00", "Taste of campfire goodness all within one cookie")
  $cookie2 = Cookies.new("Chococlate Chip", "$1.00", "Classic Chocolate Chip Cookie")
  $cookie3 = Cookies.new("Confetti", "$1.50", "Sugar Cookie with Sprinkles Baked in")
  $cookie4 = Cookies.new("Sugar", "$1.00", "Warm, Soft, & Sugary Cookie")
  $cookie5 = Cookies.new("Butterscotch", "$2.50", "Vanilla Cookie with Butterscotch Baked in")
  $cookie6 = Cookies.new("Lemon", "$2.00", "Fresh Lemon Cookie Dusted with Powdered Sugar")
  erb :cookies
end

get '/muffins' do
  $muffin1 = Muffins.new("Banana", "$2.00", "Fluffy Banana Muffin, Baked to Perfection")
  $muffin2 = Muffins.new("Blueberry", "$2.00", "Vanilla Muffin with Blueberries Baked in")
  $muffin3 = Muffins.new("Banana-Nut", "$2.50", "Our Classic Banana Muffin with Nuts Baked in")
  $muffin4 = Muffins.new("Apple", "$3.00", "Apple Muffin with a Vanilla Icing Drizzle")
  $muffin5 = Muffins.new("Corn", "$1.50", "Classic Corn Muffin")
  $muffin6 = Muffins.new("Strawberry", "$3.00", "Strawberry Muffin topped with Chocolate Chips")
  erb :muffins
end

get '/events' do
  erb :events
end

get '/subscribe' do
  subscribe_email(params[:email_address]) if params[:email_address]
  erb :subscribe
end





#Newsletter.subscribe(recipient).deliver_now
