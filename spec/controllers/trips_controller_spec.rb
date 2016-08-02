require 'rails_helper'

RSpec.describe TripsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'assigns @trips' do
    	trip = create(:trip)
    	get :index
    	expect(assigns(:trips)).to eq([trip])
    end
  end

end
