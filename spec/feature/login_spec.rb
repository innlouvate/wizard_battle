feature 'Enter names' do
  scenario 'displays names in battle' do
    sign_in_and_play
    expect(page).to have_content 'Heather vs. Birthday'
  end

  scenario 'display health points' do
    sign_in_and_play
    expect(page).to have_content "Heather: #{Player::DEFAULT_HP}HP"
    expect(page).to have_content "Birthday: #{Player::DEFAULT_HP}HP"
  end
end
