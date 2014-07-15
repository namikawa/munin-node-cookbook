require_relative '../spec_helper'

describe 'munin-node::client' do
  let (:chef_run) { ChefSpec::Runner.new(platform:'centos', version:'6.4').converge(described_recipe) }

  it "install munin-node" do
    expect(chef_run).to install_package("munin-node")
  end

end

