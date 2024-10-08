namespace :db_clean do
  task terminate: :environment do
    db_name = 'pd_distributions_development'
    ActiveRecord::Base.connection.execute <<-SQL
      SELECT pg_terminate_backend(pg_stat_activity.pid)
      FROM pg_stat_activity
      WHERE pg_stat_activity.datname = '#{db_name}'
      AND pid <> pg_backend_pid();
    SQL
    puts "Terminated all active connections to #{db_name}"
  end
end