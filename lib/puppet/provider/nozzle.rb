# Since there's only one nozzle type for now,
# this probably could have all gone in the provider file.
# But maybe this is good long-term.
require 'puppet/util/inifile'
class Puppet::Provider::nozzle < Puppet::Provider


  def self.nozzle_file
    return @nozzle_file if @nozzle_file
    @nozzle_file = Puppet::Util::IniConfig::File.new
    @nozzle_file.read('/etc/nozzle/nozzle.conf')
    @nozzle_file
  end

end
