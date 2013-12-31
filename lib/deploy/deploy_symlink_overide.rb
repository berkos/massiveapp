namespace :deploy do
  desc "Create symlinks to stage-specific configuration files and shared resources"
  task :symlink, :roles => :app, :except => { :no_release => true } do
    symlink_command = cleanup_targets.map   { |target| "rm -fr #{current_path}/#{target}" }
    symlink_command += release_directories.map    { |directory| "mkdir -p #{directory}" }
    symlink_command += release_symlinks.map { |from, to| "rm -fr #{current_path}/#{to} && ln -sf #{current_path}/#{from} #{current_path}/#{to}" }
    symlink_command += shared_symlinks.map    { |from, to| "rm -fr #{current_path}/#{to} && ln -sf #{shared_path}/#{from} #{current_path}/#{to}" }
    run "cd #{current_path} && #{symlink_command.join(' && ')}"
  end
end
