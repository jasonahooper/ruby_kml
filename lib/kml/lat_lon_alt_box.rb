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

  class LatLonAltBox < KML::Object
    attr_accessor :north
    attr_accessor :south
    attr_accessor :east
    attr_accessor :west
    attr_accessor :min_altitude
    attr_accessor :max_altitude
    attr_accessor :altitude_mode
    # modes = ['clampToGround', 'reltiveToGround', 'absolute']

    def render(xm=Builder::XmlMarkup.new(:indent => 2))
      raise InvalidKMLError, "LatLonAltBox.north is required" if north.nil?
      raise InvalidKMLError, "LatLonAltBox.south is required" if south.nil?
      raise InvalidKMLError, "LatLonAltBox.east is required" if east.nil?
      raise InvalidKMLError, "LatLonAltBox.west is required" if west.nil?
      # raise InvalidKMLError, "LatLonAltBox.altitudeMode must be one of #{modes}" if altitude_mode && !(modes.include? altitude_mode)

      xm.LatLonAltBox {
        xm.north(north)
        xm.south(south)
        xm.east(east)
        xm.west(west)
        xm.minAltitude(min_altitude) unless min_altitude.nil?
        xm.minAltitude(max_altitude) unless max_altitude.nil?
        xm.maxAltitude(altitude_mode || 'clampToGround')
      }
    end
  end
end