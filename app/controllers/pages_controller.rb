class PagesController < ApplicationController
  def index

  # 	if current_user
	 #  	@want=  Want.new
	 #  	@ha=  Ha.new
  # 	end
		# @all_wants = Want.all  	
		# @all_has = Ha.all  	
     #  logger.info('Inside pages controller')
  	  @actor = Actor.new
     #  @actors = Actor.all
     #  @json = Actor.all.to_gmaps4rails
     #  @circles_json = "'["
     #  @actors.each do |act|
     #    logger.info("#{act.longitude} - #{act.latitude}")
     #    @circles_json << "{'lng': #{act.longitude}, 'lat': #{act.latitude}, 'radius': 1000000},"
     #  end  
     #  @circles_json[0..-1]
     #  @circles_json<<"]'"
     #  logger.info(@circles_json)

    @actors = Actor.all

    @map = initialize_map()
    @map.zoom = :bound
    @icon_red = Cartographer::Gicon.new(:name => "red",
          :image_url => '/images/red.png',
          :shadow_url => '/images/red.png',
          :width => 32,
          :height => 37,
          :shadow_width => 32,
          :shadow_height => 23,
          :anchor_x => 0,
          :anchor_y => 20,
          :info_anchor_x => 5,
          :info_anchor_x => 1)
    @icon_green = Cartographer::Gicon.new(:name => "green",
          :image_url => '/images/green.png',
          :shadow_url => '/images/green.png',
          :width => 32,
          :height => 37,
          :shadow_width => 32,
          :shadow_height => 23,
          :anchor_x => 0,
          :anchor_y => 20,
          :info_anchor_x => 5,
          :info_anchor_x => 1)
    # Add the icons to map
    @map.icons <<  @icon_red
    @map.icons <<  @icon_green

    @marker1 = Cartographer::Gmarker.new(:name=> "org11", :marker_type => "Organization",
              :position => [27.173006,78.042086],
              :info_window => "Address",
              :icon => @icon_red) 
    @marker2 = Cartographer::Gmarker.new(:name=> "org12", :marker_type => "Organization",
              :position => [28.614309,77.201353],
              :info_window => "Address",
              :icon => @icon_green)          

    @map.markers << @marker1
    @map.markers << @marker2
    i=0
    @actors.each do |act|
       logger.info("#{act.longitude} - #{act.latitude}")
       marker3 = Cartographer::Gmarker.new(:name=> "landmark#{i}", :marker_type => "Organization",
              :position => [act.latitude,act.longitude],
              :info_window => "#{act.address}",
              :icon => @icon_red)          
              i=i+1
       @map.markers << marker3
    end 




    
  end

  def sample_ajax
    render :text => "Success"
  end
  private
  def initialize_map
     @map = Cartographer::Gmap.new( 'map' )    
     @map.controls << :type
     @map.controls << :large
     @map.controls << :scale
     @map.controls << :overview
     @map.debug = false 
     @map.marker_mgr = false
     @map.marker_clusterer = true
     
     # cluster_icons = []
     
     
     # org = Cartographer::ClusterIcon.new({:marker_type => "Organization"})
     #  org << {
     #              :url => '/images/drop.gif',
     #              :height => 73,
     #              :width => 118,
     #              :opt_anchor => [10, 0],
     #              :opt_textColor => 'black'
     #            }
     #     #push second variant
     #  org << {
     #              :url => '/images/drop.gif',
     #              :height => 73,
     #              :width => 118,
     #              :opt_anchor => [20, 0],
     #              :opt_textColor => 'black'
     #            }

     #    #push third variant
     #   org << {
     #              :url => '/images/drop.gif',
     #              :height => 73,
     #              :width => 118,
     #              :opt_anchor => [26, 0],
     #              :opt_textColor => 'black'
     #          }
     #  cluster_icons << org
     
     
     
     #  @map.marker_clusterer_icons = cluster_icons
     
     
     
     return @map
  end

  def about
  end

end
