#
# Be sure to run `pod lib lint DSCircularCollectionView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DSCircularCollectionView'
  s.version          = '1.0.3'
  s.summary          = 'Sub class of UICollectionViewLayout for circular collection view'
  s.homepage         = 'https://github.com/DoddaSrinivasan/DSCircularCollectionView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Dodda Srinivasan' => 'srinivasan.munna@gmail.com' }
  s.source           = { :git => 'https://github.com/DoddaSrinivasan/DSCircularCollectionView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'DSCircularCollectionView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'DSCircularCollectionView' => ['DSCircularCollectionView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
