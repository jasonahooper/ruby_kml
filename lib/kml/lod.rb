module KML #:nodoc:
  # Specifies where the top, bottom, right, and left sides of a bounding box for the region are aligned. Values for
  # +north+, +south+, +east+, and +west+ are required.
  #
  # * +north+ (required) Specifies the latitude of the north edge of the bounding box, in decimal degrees from 0 to ±90.
  # * +south+ (required) Specifies the latitude of the south edge of the bounding box, in decimal degrees from 0 to ±90.
  # * +east+ (required) Specifies the longitude of the east edge of the bounding box, in decimal degrees from 0 to ±180.
  #   (For overlays that overlap the meridian of 180° longitude, values can extend beyond that range.)
  # * +west+ (required) Specifies the longitude of the west edge of the bounding box, in decimal degrees from 0 to ±180.
  #   (For overlays that overlap the meridian of 180° longitude, values can extend beyond that range.)

  class Lod < KML::Object
    attr_accessor :min_lod_pixels
    attr_accessor :max_lod_pixels
    attr_accessor :min_fade_extent
    attr_accessor :max_fade_extent

    def render(xm=Builder::XmlMarkup.new(:indent => 2))
      xm.Lod {
        xm.minLodPixels(min_lod_pixels) if min_lod_pixels
        xm.maxLodPixels(max_lod_pixels) if max_lod_pixels
        xm.minFadeExtent(min_fade_extent) if min_fade_extent
        xm.maxFadeExtent(max_fade_extent) if max_fade_extent
      }
    end
  end
end