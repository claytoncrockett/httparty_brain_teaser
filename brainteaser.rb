require 'httparty'

# Or wrap things up in your own class
class StackExchange
  include HTTParty
  base_uri 'http://json-server.devpointlabs.com/api/v1'

  
  def initialize(service, page)
    @options = { query: { site: service, page: page } }
  end

  def users
    self.class.get("/users", @options)
  end

  def show(i)
    self.class.get("/users/#{i}", @options)
  end

  def create(first, last)
    self.class.post("/users", {user: { first_name: first, last_name: last }})
  end
end


def crud(y)
  stack_exchange = StackExchange.new("devpoint", 1)
  if y === 2
    puts "Which user would you like to see?"
    z = gets.strip.to_i
    puts stack_exchange.show(z)
  elsif y === 1
    puts stack_exchange.users
  else 
    puts "What is the first name?"
    w = gets.strip
    puts "What is the last name?"
    s = gets.strip
    puts stack_exchange.create(w,s)
  end
end

def start
  puts "Enter 1 for index, 2 for show, or 3 for create"
  x = gets.strip.to_i
  crud(x)
end


start