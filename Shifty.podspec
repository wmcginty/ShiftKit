#
# Be sure to run `pod lib lint Shifty.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Shifty'
  s.version          = '3.3.0'
  s.summary          = 'A small transitioning library that aims to make performing frame shifts easier.'
  s.description      = <<-DESC
Shifty is a small transitioning library designed to make creating frame shift view controller transitions much simpler.
Written entirely in Swift, Shifty aims to abstract away the boilerplate math and coordinate space conversions needed to
make these transitions seamless. This, combined with a multiple of customization points and options allows you to focus
on creating the transition that is custom to your app.
                       DESC

  s.homepage         = 'https://github.com/wmcginty/Shifty'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'William McGinty' => 'mcgintw@gmail.com' }
  s.source           = { :git => 'https://github.com/wmcginty/Shifty.git', :tag => s.version.to_s }
  s.swift_version    = '5.0'

  s.ios.deployment_target = '11.0'
  s.source_files = 'Sources/Shifty/**/*'
  s.frameworks = 'UIKit'

end
