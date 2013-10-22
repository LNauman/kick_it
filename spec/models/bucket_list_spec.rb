require 'spec_helper'

describe BucketList do
  it {should belong_to(:user)}

  it {should have_valid(:title).when('Philly', 'Life List')}
  it {should_not have_valid(:title).when(nil, "")}

end
