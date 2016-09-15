describe yum.repo('influxdb') do
  it { should exist }
  it { should be_enabled }
end

describe package('telegraf') do
  it { should be_installed }
end

describe service('telegraf') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe command('telegraf -config /etc/telegraf/telegraf.conf -config-directory /etc/telegraf/telegraf.d -test') do
  its('stdout') { should match /Plugin: ping/ }
  its('exit_status') { should eq 0 }
end
