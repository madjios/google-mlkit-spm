DEPLOYMENT_TARGET = '11.0'

# Uncomment the next line to define a global platform for your project
platform :ios, DEPLOYMENT_TARGET

# ignore all warnings from all pods
inhibit_all_warnings!

install! 'cocoapods',
         :warn_for_unused_master_specs_repo => false

target 'MLKitSPM' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for MLKitSPM

  pod 'GoogleMLKit/BarcodeScanning', '~> 3.2.0'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = DEPLOYMENT_TARGET
    end
  end
end