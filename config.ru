$:.unshift '.'
require 'config/environment'

use Rack::Static, :urls => ['/css'], :root => 'public' # Rack fix allows seeing the css folder.

if defined?(ActiveRecord::Migrator) && ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending run `rake db:migrate` to resolve the issue.'
end

# auto-add controllers
Dir[File.join(File.dirname(__FILE__), "app/controllers", "*.rb")].collect {|file| File.basename(file).split(".")[0] }.reject {|file| file == "application_controller" }.each do |file|
  string_class_name = file.split('_').collect { |w| w.capitalize }.join
  class_name = Object.const_get(string_class_name)
  use class_name
end

use Rack::MethodOverride
use LandmarksController
use FiguresController
run ApplicationController
