require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    User.create(username: 'Jeff', password: 'jeffisthebest')
  end

  context 'checks for validations'
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }

  context 'tests different class methods'

  context 'rocks out session tokens'
  it 'generates a session_token via ensure_session_token' do
    expect(user.session_token).to_not be_nil
  end

  it 'generates its session token before valadation is run' do
    user.valid?
    expect(user.session_token).to_not be_nil
  end

  context 'scrambles passwords like a bawss'
  it 'scrambles a password into a password_digest' do
    # Works, since the password_digest is only set this way.
    expect(user.password_digest).to_not be_nil
  end
  it 'doesn\'t store the password in the database' do
    # Works? @passsword shouldn't survive long, so....
    expect(user.password_digest).to_not eq(user.password)
  end

  context 'uses #find_by_credientials to get information from the database'
  it 'finds a user by their username with the correct password' do
    expect(User.find_by_credentials(user.username, user.password)).to eq(user)
  end
  it 'doesn\'t find partial matches from user information' do
    expect(User.find_by_credentials(user.username, 'partyoverhere')).to eq(nil)
  end

  context 'looks for associations'
  it { should have_many(:cheers) }
  it { should have_many(:goals) }
end
