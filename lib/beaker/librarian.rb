require 'beaker/librarian/version'

require 'beaker-rspec/spec_helper'

module Beaker
  module Librarian
    include Beaker::DSL

    # Install rubygems and the librarian-puppet gem onto each host
    def install_librarian(opts = {})
      # Check for 'librarian_version' option
      librarian_version = opts['librarian_version'] ||= nil

      hosts.each do |host|
        install_package host, 'rubygems'
        install_package host, 'git'
        if librarian_version
          on host, "gem install --no-ri --no-rdoc librarian-puppet -v '#{librarian_version}'" 
        else
          on host, 'gem install --no-ri --no-rdoc librarian-puppet' 
        end
      end
    end

    # Copy the module under test to a temporary directory onto the host, and execute librarian-puppet to install
    # dependencies into the 'distmoduledir'.
    #
    # This also manually installs the module under test into 'distmoduledir', but I'm noting here that this is 
    # something I believe should be handled automatically by librarian-puppet, but is not.
    def librarian_install_modules(directory, module_name)
      hosts.each do |host|
        sut_dir = File.join('/tmp', module_name)
        scp_to host, directory, sut_dir

        on host, "cd #{sut_dir} && librarian-puppet install --clean --verbose --path #{host['distmoduledir']}"

        puppet_module_install(:source => directory, :module_name => module_name)
      end
    end
  end
end

include Beaker::Librarian
