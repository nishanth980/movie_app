require 'shrine'
require 'shrine/storage/file_system'
require 'shrine/storage/s3'

s3_options = {
  # Required
  region: ENV['AWS_REGION'],
  bucket: ENV['AWS_BUCKET'],
  access_key_id: ENV['AWS_KEY'],
  secret_access_key: ENV['AWS_SECRET']
}

Shrine.storages = {
  # With Shrine both temporary (:cache) and permanent (:store) storage are first-class citizens and fully configurable, so you can also have files cached on S3.
  cache: Shrine::Storage::S3.new(prefix: 'cache', **s3_options),
  store: Shrine::Storage::S3.new(
    multipart_threshold: { upload: 30 * 1024 * 1024, copy: 200 * 1024 * 1024 },
    prefix: ENV['PREFIX'],
    upload_options: { acl: 'private' },
    **s3_options
  )
}

Shrine.plugin :activerecord           # loads Active Record integration
Shrine.plugin :cached_attachment_data # enables retaining cached file across form redisplays
Shrine.plugin :restore_cached_data    # extracts metadata for assigned cached files
