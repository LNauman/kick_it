require 'spec_helper'

describe Adventure do
  it { should belong_to(:bucket_list) }

  it { should have_valid(:adventure_description).when('skydive', 'rocky steps') }
  it { should_not have_valid(:adventure_description).when(nil, "") }


  it { should validate_presence_of(:bucket_list) }
end
