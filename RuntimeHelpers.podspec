#
# Be sure to run `pod spec lint RuntimeHelpers.podspec' to ensure this is a
# valid spec.
#
# Remove all comments before submitting the spec. Optional attributes are commented.
#
# For details see: https://github.com/CocoaPods/CocoaPods/wiki/The-podspec-format
#
Pod::Spec.new do |s|
  s.name         = "RuntimeHelpers"
  s.version      = "0.0.1"
  s.summary      = "A collection of helpers related to objc/runtime."
  s.homepage     = "http://EXAMPLE/UIKitHelpers"
  s.license      = 'MIT'
  s.author       = { "Fernando Mazzon" => "Fernando.Mazzon@rga.com" }
  s.source       = { :git => "https://fmazzon@bitbucket.org/rgaps/runtimehelpers.git", :tag => "0.0.1" }
  s.source_files = 'Classes', 'Classes/**/*.{h,m}'
  s.public_header_files = 'Classes/**/*.h'
  s.framework  = 'Foundation'
  s.requires_arc = true
end
