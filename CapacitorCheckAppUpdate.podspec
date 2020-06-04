
  Pod::Spec.new do |s|
    s.name = 'CapacitorCheckAppUpdate'
    s.version = '1.0.1'
    s.summary = 'Checks the App and Play store for app updates'
    s.license = 'MIT'
    s.homepage = 'https://github.com/MarnickvdA/capacitor-check-app-update.git'
    s.author = 'A Bit of Software B.V.'
    s.source = { :git => 'https://github.com/MarnickvdA/capacitor-check-app-update.git', :tag => s.version.to_s }
    s.source_files = 'ios/Plugin/**/*.{swift,h,m,c,cc,mm,cpp}'
    s.ios.deployment_target  = '11.0'
    s.dependency 'Capacitor'
  end
