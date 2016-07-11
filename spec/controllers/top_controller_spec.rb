# frozen_string_literal: true

RSpec.describe TopController, type: :controller do
  let(:valid_attributes) do
    {}
  end

  let(:valid_session) { {} }

  describe 'GET show' do
    it 'redirect to buckets' do
      get :show, params: valid_attributes, session: valid_session
      expect(response).to redirect_to(buckets_path)
    end
  end
end
