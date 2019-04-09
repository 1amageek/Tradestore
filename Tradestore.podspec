
Pod::Spec.new do |s|

s.name         = "Tradestore"
s.version      = "0.1.8"
s.summary      = "Firestore trade framework"
s.description  = <<-DESC
Tradestore is a library for Cloud Firestore's EC business.
DESC
s.homepage     = "https://github.com/1amageek/Tradestore"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author             = { "1amageek" => "tmy0x3@icloud.com" }
s.social_media_url   = "http://twitter.com/1amageek"
s.platform     = :ios, "12.2"
# s.ios.deployment_target = "11.0"
# s.osx.deployment_target = "10.7"
# s.watchos.deployment_target = "2.0"
# s.tvos.deployment_target = "9.0"
s.source       = { :git => "https://github.com/1amageek/Tradestore.git", :tag => "#{s.version}" }
s.source_files  = "Tradestore/**/*.swift"
s.requires_arc = true
s.static_framework = true
s.dependency "Ballcap"
s.dependency "Firebase/Core"
s.dependency "Firebase/Firestore"
end
