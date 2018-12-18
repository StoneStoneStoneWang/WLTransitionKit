

Pod::Spec.new do |s|

s.name         = "WLTransitionKit"
s.version      = "1.0.8"
s.summary      = "A Lib For transition."
s.description  = <<-DESC
A Lib For transition.
DESC

s.homepage     = "https://github.com/StoneStoneStoneWang/WLTransitionKit"
s.license      = { :type => "MIT", :file => "LICENSE.md" }
s.author             = { "StoneStoneStoneWang" => "yuanxingfu1314@163.com" }
s.platform     = :ios, "9.0"
s.ios.deployment_target = "9.0"

s.swift_version = '4.2'

s.frameworks = 'UIKit', 'Foundation'

s.source = { :git => "https://github.com/StoneStoneStoneWang/WLTransitionKit.git", :tag => "#{s.version}" }

s.source_files = "Code/**/*.{swift}"

s.dependency 'WLToolsKit'

s.dependency 'WLBaseViewController'

end


