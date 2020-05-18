# frozen_string_literal: true

describe 'POST api/articles', type: :request do
  let(:author) { create(:user) }
  let(:credentials) { author.create_new_auth_token }
  let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }

  it 'creates an instance of article with valid params' do
    post '/api/articles',
         params: { article:
         {
           title: 'whatever works',
           content: 'This is the body of the article...'
         } },
         headers: headers

    expect(Article.last).not_to eq nil
  end
end
