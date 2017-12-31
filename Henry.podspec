Pod::Spec.new do |s|
  s.name = "Henry"
  s.version = "1.0.0"
  s.license = "MIT"
  s.summary = "Simple Log Monitor Tool for iOS Application"
  s.author = "Toshinori Watanabe"
  s.homepage = "https://github.com/watanabetoshinori/Henry"
  s.source = { :git => "git@github.com:watanabetoshinori/Henry.git", :tag => s.version }

  s.ios.deployment_target = '10.0'

  s.source_files = 'Sources/*.{h,swift}'
  s.resources = 'Resources/*.{xib,storyboard}', 'Resources/*.xcassets'

end
