app_path = '/var/www/api/current'

# Set the working directory of this unicorn instance.
working_directory app_path

# Set the location of the unicorn pid file. This should match what we put in the
# unicorn init script later.
pid '/var/www/pids/unicorn.pid'

# You should define your stderr and stdout here. If you don't, stderr defaults
# to /dev/null and you'll lose any error logging when in daemon mode.
stderr_path '/var/www/api/shared/log/unicorn.error.log'
stdout_path '/var/www/api/shared/log/unicorn.log'

# Load the app up before forking.
preload_app false

# Garbage collection settings.
GC.respond_to?(:copy_on_write_friendly=) &&
  GC.copy_on_write_friendly = true

# If using ActiveRecord, disconnect (from the database) before forking.
before_fork do |server, worker|
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.connection.disconnect!
end

# After forking, restore your ActiveRecord connection.
after_fork do |server, worker|
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.establish_connection
end

listen '/var/sockets/unicorn.api.sock', backlog: 64