Pod::Spec.new do |s|
  s.name             = "ESConveyorBelt"
  s.version          = "0.2.0"
  s.summary          = "Create nice tutorial pages with parallax and animations with ease"
  s.description      = <<-DESC
                       ESConveyorBelt is a UICollectionView subclass that allows you to 
			create simple tutorial screen with animations for elements presented.
			
			More info to come.

                       DESC
  s.homepage         = "https://github.com/escoz/ESConveyorBelt/"
  s.license          = 'MIT'
  s.author           = { "Eduardo Scoz" => "eduardoscoz@gmail.com" }
  s.source           = { :git => "https://github.com/escoz/ESConveyorBelt.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/escoz'

  s.platform     = :ios, '7.0'
  s.ios.deployment_target = '7.0'
  s.requires_arc = true

  s.source_files = 'Classes'

  s.public_header_files = 'Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
end
