require 'serverspec'

# Required by serverspec
set :backend, :exec

describe file('/var/log/osquery/osqueryd.results.log'), :if => host_inventory['virtualization'][:system] != 'docker' do
  it { should contain '"system_info",' }
  it { should contain '"physical_memory":' }
# for some reason, this one requires two slashes (root fim rule)
  it { should contain '"target_path":"\/\/fim-testing1' }
  it { should contain '"target_path":"\/root\/fim-testing2' }
  it { should contain '"target_path":"\/lib\/fim-testing3' }
  it { should contain '"target_path":"\/usr\/bin\/fim-testing4' }
  it { should contain '"target_path":"\/usr\/bin\/.fim-testing5' }
  it { should contain '"action":"CREATED"' }
  it { should contain '"action":"UPDATED"' }
#  it { should_not contain '"target_path":"\/tmp\/' }
  it { should_not contain '"target_path":"\/var\/' }
  it { should_not contain '"target_path":"\/tmp\/too_many_events\/fim-testing1' }
#  it { should contain '"target_path":"\/tmp\/too_many_events\/a\/fim-testing2' }
#  it { should contain '"target_path":"\/tmp\/too_many_events\/a\/b\/fim-testing3' }
  it { should_not contain '"target_path":"\/tmp\/too_many_events2\/fim-testing1' }
  it { should_not contain '"target_path":"\/tmp\/too_many_events2\/a\/fim-testing2' }
  it { should_not contain '"target_path":"\/tmp\/too_many_events2\/a\/b\/fim-testing3' }
  it { should_not contain '"target_path":"\/tmp\/too_many_events3\/fim-testing1' }
  it { should_not contain '"target_path":"\/tmp\/too_many_events3\/a\/fim-testing2' }
  it { should_not contain '"target_path":"\/tmp\/too_many_events3\/a\/b\/fim-testing3' }
  it { should_not contain '"target_path":"\/tmp\/excluded1-abcdef' }
  it { should_not contain '"target_path":"\/tmp\/abcdef-excluded2' }
  it { should_not contain '"target_path":"\/tmp\/excluded3-abcdef-testing' }
  it { should_not contain '"target_path":"\/tmp\/excluded4-abcdef-testing-ghijkl-testing-mnopqr' }
  it { should_not contain '"target_path":"\/tmp\/excluded5-exact-match' }
  it { should_not contain '"target_path":"\/tmp\/excluded6-abcdef' }
  it { should_not contain '"target_path":"\/tmp\/excluded6-testing\/excluded-abcdef' }
  it { should_not contain '"target_path":"\/var\/tmp\/fim-testing-a\/fim-testing1' }
#  it { should contain '"target_path":"\/var\/tmp\/fim-testing-a\/.fim-testing2' }
  it { should_not contain '"target_path":"\/var\/tmp\/fim-testing-a\/.b/fim-testing3' }
#  it { should contain '"target_path":"\/var\/tmp\/fim-testing-b\/.fim-testing4' }
#  it { should contain '"target_path":"\/var\/tmp\/fim-testing-b\/.c/fim-testing5' }
#  it { should contain '"target_path":"\/var\/tmp\/fim-testing-b\/.c/d/fim-testing6' }
  it { should contain '"target_path":"\/\/fim-testing-a' }
  it { should contain '"target_path":"\/\/fim-testing-dir' }
  it { should contain '"target_path":"\/\/fim-testing0' }
  it { should_not contain '"target_path":"\/fim-testing-a\/fim-testing-b\/fim-testing10' }
  it { should_not contain '"target_path":"\/fim-testing-a\/fim-testing-b\/fim-testing-c\/fim-testing11' }
end
