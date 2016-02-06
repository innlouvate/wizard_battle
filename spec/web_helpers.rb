def sign_in_and_play
  visit('/')
  click_button "2 players"
  fill_in :player_1, with: 'Heather'
  fill_in :player_2, with: 'Birthday'
  click_button 'Submit'
end

def sign_in_and_play_for1
  visit('/')
  click_button "1 player"
  fill_in :player_1, with: 'Heather'
  click_button 'Submit'
end
