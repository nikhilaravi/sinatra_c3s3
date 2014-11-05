require 'sinatra'
require 'csv'

get '/' do
  erb :index
end

get '/todo' do
  @todos = ['Order canapes', 'Confirm event details with attendees', 'Book band']
 
  erb :todo
end

get '/schedule' do
  @schedule = [ ['8pm',    'Doors open'],
                ['8.30pm', 'Champagne and canapes served'],
                ['9pm',    'Speech'],
                ['9.30pm', 'Painting unveiled'],
                ['9.40pm', 'Live band plays'] ]

  erb :schedule
end

get '/rsvps' do
  @rsvps = CSV.read('rsvps.csv')

  @acceptances = []
  @rejections  = []
  @acceptance_count = 0
  @rejection_count  = 0

  @rsvps.each do |rsvp|

    if rsvp[1] == "yes"
      @acceptances << rsvp[0]
      @acceptance_count = @acceptance_count + 1
    else 
      @rejections << rsvp[0]
      @rejection_count = @rejection_count + 1
    

  erb :rsvps
end