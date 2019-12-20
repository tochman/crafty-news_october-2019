RSpec.describe Article, type: :model do
  describe "DB columns" do
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column :content }
  end
  
  describe "Validations" do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :content }
  end

  describe 'Associations' do
    it { is_expected.to have_many :comments }
  end

  it "has a valid Factory" do
    expect(create(:article)).to be_valid
  end
end
