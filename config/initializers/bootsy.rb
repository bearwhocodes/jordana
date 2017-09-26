Bootsy.setup do |config|
  config.image_versions_available = [:small, :medium, :large, :original]
  config.small_image[:width] = 160
  config.small_image[:height] = 160
  config.medium_image[:width] = 360
  config.medium_image[:height] = 360
  config.large_image[:width] = 760
  config.large_image[:height] = 760
  config.storage = :fog
end