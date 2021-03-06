require 'dragonfly'
app = Dragonfly[:waffle_assets]

app.configure_with(:imagemagick)
app.configure_with(:rails)
if ENV['S3_BUCKET']
  app.configure do |c|
    c.datastore = Dragonfly::DataStorage::S3DataStore.new(
      :bucket_name => ENV['S3_BUCKET'],
      :access_key_id => ENV['S3_KEY'],
      :secret_access_key => ENV['S3_SECRET']
    )
  end
end

app.define_macro(ActiveRecord::Base, :image_accessor)