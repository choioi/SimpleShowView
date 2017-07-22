#
# Be sure to run `pod lib lint SimpleShowView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SimpleShowView'
  s.version          = '0.1.0'
  s.summary          = 'Show view animation is simple with one line!'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC

//show a view
viewHolder.showXib(with: XIB1())


//hide a view
viewHolder.hideXib()

//show a part 1 view
viewHolder.showXibMinimize(heightMustHide: 100)

//show full height a view
viewHolder.showXibMaximize()


//Show a popup viewcontroller in storyboard with animation

let popupVC = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
showPopup(vc: popupVC)


//Show a popup xib viewcontroller with animation
let popupVC:XibVC  = XibVC.loadFromNib()
showPopup(vc: popupVC)
                       DESC

  s.homepage         = 'https://github.com/choioi/SimpleShowView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'choioi' => 'phungnet001@gmail.com' }
  s.source           = { :git => 'https://github.com/choioi/SimpleShowView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'SimpleShowView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SimpleShowView' => ['SimpleShowView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
