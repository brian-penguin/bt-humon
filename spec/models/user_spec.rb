describe User, 'Validations' do
  it { should validate_uniqueness_of(:device_token) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
end
