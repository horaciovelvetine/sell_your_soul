require './config/environment'

path = File.expand_path "../", __FILE__

use Rack::MethodOverride
# use SuckersController
# use Corporations_Controller
run ApplicationController