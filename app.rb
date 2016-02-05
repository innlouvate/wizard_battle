require 'sinatra/base'
require './lib/player'
require './lib/game'

class WizBat < Sinatra::Base
  enable :sessions

  get '/' do
    @players = session[:players]
    erb(:index)
  end

  get '/oneplayer' do
    session[:players] = 1
    redirect '/'
  end

  get '/twoplayers' do
    session[:players] = 2
    redirect '/'
  end

  post '/names1' do
    @player_1 = Player.new(params[:player_1])
    @player_2 = Player.new("CPU", true)
    $game = Game.new(@player_1, @player_2)
    redirect '/play'
  end


  post '/names2' do
    @player_1 = Player.new(params[:player_1])
    @player_2 = Player.new(params[:player_2])
    $game = Game.new(@player_1, @player_2)
    redirect '/play'
  end

  get '/play' do
    $game.switch_turn
    @player_1 = $game.player_1.name
    @player_2 = $game.player_2.name
    @player_turn = $game.turn.name
    @player1_points = $game.player_1.hp
    @player2_points = $game.player_2.hp
    erb(:play)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
