namespace :wafflemix do

  # desc "Explaining what the task does"
  # task :wafflemix do
  #   # Task goes here
  # end

  desc "Create Initial Pages"
  task :initial_setup do
    ::Wafflemix::Page.create(:link_url => '/', :title => 'Home', :draft => false, :deletable => false)
    ::Wafflemix::Role.create(:name => 'admin')
    ::Wafflemix::Role.create(:name => 'super_user')
  end

end
