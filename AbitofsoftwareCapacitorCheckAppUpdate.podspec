require 'json'

  Pod::Spec.new do |s|
    package = JSON.parse(File.read(File.join(File.dirname(__FILE__), 'package.json')))

    s.name = 'AbitofsoftwareCapacitorCheckAppUpdate'
    s.version = package['version']
    s.summary = package['description']
    s.license = package['license']
    s.homepage = package['homepage']
    s.author = package['author']
    s.source = { :git => 'https://github.com/MarnickvdA/capacitor-check-app-update.git', :tag => s.version.to_s }
    s.source_files = 'ios/Plugin/**/*.{swift,h,m,c,cc,mm,cpp}'
    s.ios.deployment_target  = '11.0'
    s.dependency 'Capacitor'
  end
