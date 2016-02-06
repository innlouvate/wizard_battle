feature 'Freezing player' do

  scenario 'player_1 freezes player_2' do
    sign_in_and_play
    allow(Kernel).to receive(:rand).and_return(0)
    click_button 'Freeze!'
    expect(page).to have_content 'Heather froze Birthday'
  end

  scenario 'player_1 failed to freeze player_2' do
    sign_in_and_play
    allow(Kernel).to receive(:rand).and_return(1)
    click_button 'Freeze!'
    expect(page).to have_content 'Heather tried to freeze Birthday but failed...'
  end

  scenario 'player_2 freezes player_1' do
    sign_in_and_play
    allow(Kernel).to receive(:rand).and_return(0)
    click_button 'Attack!'
    # click_button 'Play again!'
    click_button 'Freeze!'
    expect(page).to have_content 'Birthday froze Heather'
  end

  scenario 'player_2 failed to freeze player_1' do
    sign_in_and_play
    allow(Kernel).to receive(:rand).and_return(1)
    click_button 'Attack!'
    # click_button 'Play again!'
    click_button 'Freeze!'
    expect(page).to have_content 'Birthday tried to freeze Heather but failed...'
  end

  scenario 'successful freeze HPs reduced' do
    sign_in_and_play
    allow(Kernel).to receive(:rand).and_return(0)
    click_button 'Freeze!'
    # click_button 'Play again!'
    expect(page).to have_content "Birthday: #{Player::DEFAULT_HP-1}HP"
  end

  scenario 'successful freeze skips turn' do
    sign_in_and_play
    allow(Kernel).to receive(:rand).and_return(0)
    click_button 'Freeze!'
    # click_button 'Play again!'
    expect(page).to have_content "Heather's turn"
  end

  scenario 'Other players hp are the same when frozen' do
    sign_in_and_play
    random = rand(10)
    hp = Player::DEFAULT_HP - random
    allow(Kernel).to receive(:rand).and_return(random)
    click_button 'Freeze!'
    # click_button 'Play again!'
    click_button 'Freeze!'
    # click_button 'Play again!'
    expect(page).to have_content "Heather: #{Player::DEFAULT_HP}HP"
  end

end
