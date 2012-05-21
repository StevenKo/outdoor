namespace :dump do
  task :in => ["db:drop","db:create","db:migrate","db:data:load"]
end