require 'rails_helper'

RSpec.describe User, type: :model do

  it { should have_many(:notes) }
  it { should have_many(:likes) }

  it { should have_many(:followers).class_name('Following').with_foreign_key('follower_id') }
  it { should have_many(:followees).class_name('Following').with_foreign_key('followee_id') }

end
