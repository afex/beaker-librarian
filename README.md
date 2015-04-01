# Beaker::Librarian

Helpers to allow beaker-based tests to use librarian-puppet for module installation on VM hosts

## Installation

Add this line to your application's Gemfile:

    gem 'beaker-librarian'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install beaker-librarian

## Usage

Example ```spec_helper_acceptance.rb``` to pre-install modules from Puppetfile.

```ruby
require 'beaker-rspec/spec_helper'
require 'beaker-rspec/helpers/serverspec'
require 'beaker/librarian'

RSpec.configure do |c|
	proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

	c.before :suite do
		install_puppet
		install_librarian
		librarian_install_modules(proj_root, 'mymodule')
	end
end
```

To install a specific version of librarian-puppet, e.g. to support Ruby 1.8.x, replace the ```install_librarian``` line above with ```install_librarian({'librarian_version' => '~>1.5.0'})```.

## Contributing

1. Fork it ( http://github.com/afex/beaker-librarian/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
