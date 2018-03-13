Pod::Spec.new do |s|
  s.name         = "RuntimeHelpers"
  s.version      = "0.0.5"
  s.summary      = "RuntimeHelpers."
  s.homepage     = "https://github.com/fer662/RuntimeHelpers"
  s.license      = 'MIT'
  s.author       = { "Fernando Mazzon" => "fer662@gmail.com" }
  s.source       = { :git => "https://github.com/fer662/RuntimeHelpers.git", :tag => "0.0.5" }
  s.platform     = :ios
  s.source_files = 'Classes', 'Classes/**/*.{h,m}'
  s.public_header_files = 'Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
  s.requires_arc = true
end
