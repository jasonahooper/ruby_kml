# This source file implements the Feature class of KML.
#
# Basic XML chunk structure:
#
#   <Region id="ID">
#     <LatLonAltBox>
#       <north></north>                     <!-- required; kml:angle90 -->
#       <south></south>                     <!-- required; kml:angle90 -->
#       <east></east>                       <!-- required; kml:angle180 -->
#       <west></west>                       <!-- required; kml:angle180 -->
#       <minAltitude>0</minAltitude>        <!-- float -->
#       <maxAltitude>0</maxAltitude>        <!-- float -->
#       <altitudeMode>clampToGround</altitudeMode>
#         <!-- kml:altitudeModeEnum: clampToGround, relativeToGround, or absolute -->
#     </LatLonAltBox>
#     <Lod>
#       <minLodPixels>0</minLodPixels>      <!-- float -->
#       <maxLodPixels>-1</maxLodPixels>     <!-- float -->
#       <minFadeExtent>0</minFadeExtent>    <!-- float -->
#       <maxFadeExtent>0</maxFadeExtent>    <!-- float -->
#     </Lod>
#   </Region>

module KML #:nodoc:
  # Class for all KML Regions
  class Region < KML::Object
    attr_accessor :lat_lon_alt_box
    attr_accessor :lod

    def render(xm=Builder::XmlMarkup.new(:indent => 2))
      xm.Region(:id => id) {
        raise InvalidKMLError, "Region.lat_lon_alt_box is required" if lat_lon_alt_box.nil?
        lat_lon_alt_box.render(xm)
        lod.render(xm) if lod
      }
    end
  end
end
