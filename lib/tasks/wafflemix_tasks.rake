namespace :wafflemix do

  # desc "Explaining what the task does"
  # task :wafflemix do
  #   # Task goes here
  # end

  desc "Create Initial Pages"
  task :initial_pages do
    Page.create()
  end

end
