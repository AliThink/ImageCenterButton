Pod::Spec.new do |s|
  s.name         = "ImageCenterButton"
  s.version      = "0.1.0"
  s.summary      = "An UIButton with TopImage and BottomLabel"
  s.homepage     = "https://github.com/AliThink/ImageCenterButton"
  s.license      = "MIT"
  s.author             = { "AliThink" => "cloudsthinker@126.com" }
  s.source       = { :git => "https://github.com/AliThink/ImageCenterButton.git", :tag => "v0.1.0" }
  s.source_files  = "WechatShortVideo/**/*.{h,m}"
  s.platform      = :ios, '7.0'
  s.requires_arc  = true
end
