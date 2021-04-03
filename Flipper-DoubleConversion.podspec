Pod::Spec.new do |s|
    s.name         = "Flipper-DoubleConversion"
    s.version      = "3.1.7"
    s.summary      = 'Efficient binary-decimal and decimal-binary conversion routines for IEEE doubles'
    s.homepage     = "https://github.com/priteshrnandgaonkar/double-conversion/"
    s.source       = { :git => 'https://github.com/priteshrnandgaonkar/double-conversion.git', :branch => "master" }
    s.license      = { :type => 'BSD', :file => 'LICENSE' }
    s.authors      = {'Prtesh Nandgaonkar' => 'prit.nandgaonkar@gmail.com'}
    s.requires_arc = true
    s.cocoapods_version = '>= 1.9'
    s.ios.deployment_target = '9.0'
    s.osx.deployment_target = '10.10'
    s.vendored_frameworks = 'framework/DoubleConversion.xcframework'
  end
