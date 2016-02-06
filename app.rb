require 'sinatra/base'
require './lib/player'
require './lib/game'
require './lib/log'

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
    @game = $game
    # @player_1 = $game.player_1.name
    # @player_2 = $game.player_2.name
    # @player_turn = $game.turn.name
    # @player1_points = $game.player_1.hp
    # @player2_points = $game.player_2.hp
    # @display_log = $game.log.display
    # @game_over = $game.game_over?
    erb(:play)
  end


  get '/attack' do
    # @turn = $game.turn.name
    # @opponent = $game.opponent.name
    $game.attack($game.opponent)
    # $game.switch_turn
    redirect '/play'
  end

  get '/freeze' do
    # @turn = $game.turn.name
    # @opponent = $game.opponent.name
    $game.freeze($game.opponent)
    redirect '/play'
  end

  get '/comp' do
    $game.cpu_turn
    redirect '/play'
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
