feature 'Attacking player' do

  scenario 'player_1 is going to attack player_2.' do
    sign_in_and_play
    click_button 'Attack!'
    expect(page).to have_content 'Heather attacked Birthday'
  end

  scenario 'HPs are reduced when attacked' do
    sign_in_and_play
    random = rand(10)
    hp = Player::DEFAULT_HP - random
    allow(Kernel).to receive(:rand).and_return(random)
    click_button 'Attack!'
    # click_button 'Play again!'
    expect(page).to have_content "Birthday: #{hp}HP"
  end

  # scenario 'HPs are the same when miss' do
  #   sign_in_and_play
  #   allow(Kernel).to receive(:rand).and_return(0)
  #   click_button 'Attack!'
  #   click_button 'Play again!'
  #   expect(page).to have_content "Birthday: #{Player::DEFAULT_HP}HP"
  # end

  scenario 'displays message about HP lost' do
    sign_in_and_play
    random = rand(10)
    hp = Player::DEFAULT_HP - random
    allow(Kernel).to receive(:rand).and_return(random)
    click_button 'Attack!'
    expect(page).to have_content "causing #{random}HP damage"
  end

  # scenario 'displays message that the attack missed' do
  #   sign_in_and_play
  #   allow(Kernel).to receive(:rand).and_return(0)
  #   click_button 'Attack!'
  #   expect(page).to have_content "The attack missed..."
  # end

  scenario 'HPs are reduced when attacked' do
    sign_in_and_play
    random = rand(10)
    hp = Player::DEFAULT_HP - random
    allow(Kernel).to receive(:rand).and_return(random)
    click_button 'Attack!'
    # click_button 'Play again!'
    click_button 'Attack!'
    # click_button 'Play again!'
    expect(page).to have_content "Heather: #{hp}HP"
  end

  scenario 'you can win' do
    sign_in_and_play
    allow(Kernel).to receive(:rand).and_return(Player::DEFAULT_HP)
    click_button 'Attack!'
    # click_button 'Play again!'
    expect(page).to have_content "Heather wins!"
  end

end
