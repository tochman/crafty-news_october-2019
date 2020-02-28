# frozen_string_literal: true

describe Users::ShowSerializer, type: :serializer do
  let(:sample) { create(:user) }
  let(:serialization) { described_class.new(sample.reload) }
  subject { JSON.parse(serialization.to_json) }

  it 'contail relevant keys' do
    expected_keys = ['id', 'email']
    expect(subject.keys).to match expected_keys
  end
end
