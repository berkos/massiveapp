namespace :deploy do
 desc "Download the production log file"
  task :get_log do
    get "#{current_path}/log/production.log", "#{Time.now.strftime("%Y%m%d%H%M")}.production.log"
  end
  desc "Download the entire log directory"
  task :get_log_directory do
    get "#{current_path}/log/", "tmp/", :recursive => true
  end
  desc "Download the production log file"
  task :download_log do
    download "#{current_path}/log/production.log", "$CAPISTRANO:HOST$.production.log"
  end
end