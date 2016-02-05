feature 'players switch turns after each move' do

  scenario 'player 1 attacks and becomes player2 turn' do
    sign_in_and_play
    click_button 'Attack!'
    click_button 'Play again!'
    expect(page).to have_content "Birthday's turn"
  end

end
