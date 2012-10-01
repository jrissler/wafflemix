require 'dragonfly'

app = Dragonfly[:images]
app.configure_with(:imagemagick)
app.configure_with(:rails)

app.define_macro(ActiveRecord::Base, :image_accessor)

app.datastore = Dragonfly::DataStorage::S3DataStore.new
app.datastore.configure do |c|
  c.bucket_name = ENV['S3_BUCKET']
  c.access_key_id = ENV['S3_KEY']
  c.secret_access_key = ENV['S3_SECRET']
end