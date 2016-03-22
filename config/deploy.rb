# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'ImageSeller'
set :repo_url, 'git@github.com:ehainer/ImageSeller.git'

set :ssh_options, {
	forward_agent: true,
	port: 22,
	keepalive: true,
	keepalive_interval: 60
}

# Default value for :pty is false
set :pty, true

set :linked_dirs, fetch(:linked_dirs, []).push("var", "pub")
set :linked_files, fetch(:linked_files, []).push("app/etc/env.php")

namespace :deploy do
	after :restart, :clear_cache do
		on roles(:web), in: :groups, limit: 3, wait: 10 do |hostname, role, props|
			within release_path do
				execute :rake, 'cache:clear'
			end
		end
	end
end
