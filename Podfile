# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

target 'clean_architechture' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  inhibit_all_warnings!
  
    # Core
    pod 'RxAlamofire', '6.1'
    pod 'RxViewController'
    pod 'NSObject+Rx', '5.2'
    pod 'ObjectMapper', '4.2'
    pod 'RxCocoa'
    
    # UI
    pod 'MBProgressHUD'
    pod 'SwiftGradients', '~> 1.0.0'
    pod 'Kingfisher', '~> 7.0'
    
    # Common
    pod 'Reusable', '4.1'
    pod 'ValidatedPropertyKit'
    pod 'Then'
    pod 'R.swift', '6.0.0'
    pod 'SwiftLint'
    
  target 'clean_architechtureTests' do
    inherit! :search_paths
    pod 'RxTest'
  end
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 12.0
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
        config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
        config.build_settings['GCC_WARN_INHIBIT_ALL_WARNINGS'] = "YES"
      end
    end
  end
end
