require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
#ActiveRecord::Base.logger.level = nil
require_all 'lib'
