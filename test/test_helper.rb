require 'test/unit'
require 'pathname'
require 'rubygems'

require 'shoulda'
require 'matchy'

begin require 'redgreen'; rescue LoadError; end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'options_pricing'