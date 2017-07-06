require 'rails_helper'

RSpec.describe User, type: :model do

  it { should have_many(:notes) }
  it { should have_many(:likes) }

  it { should have_many(:followers).class_name('Following').with_foreign_key('follower_id') }
  it { should have_many(:followees).class_name('Following').with_foreign_key('followee_id') }

  describe 'instance method followed?' do

    let(:current_user) { create(:user) }
    let(:user2) { create(:user) }

    context 'when current_user is following user2' do

      let!(:following) { create(:following, follower: current_user, followee: user2) }

      it { expect(user2.followed?(current_user)).to eq(following) }

    end

    context 'when current_user is not following user2' do

      it { expect(user2.followed?(current_user)).to eq(nil) }

    end

  end

  describe 'instance method likes?' do

    let(:user) { create(:user) }
    let(:note) { create(:note) }

    context 'when user has liked note' do

      let!(:like) { create(:like, note: note, user: user) }

      it { expect(user.likes?(note)).to eq(like) }

    end

    context 'when user has not liked note' do

      it { expect(user.likes?(note)).to eq(nil) }

    end

  end

end
