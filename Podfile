# Uncomment the next line to define a global platform for your project
# platform :ios, '12.0'

target 'CATest' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  project 'CATest' 
  
  # Rx
  pod 'RxSwift', '~> 6.2.0'
  pod 'RxCocoa', '~> 6.2.0'
  pod 'RxViewController', '~> 2.0.0'
  pod 'RxDataSources', '~> 5.0'
  pod 'RxSwiftExt', '~> 6.0.1'

  # Rx Framework
  pod 'ReactorKit', '~> 3.1.0'
  pod 'RxFlow', '~> 2.12.4'

  # Utils
  pod 'Then', '~> 2.7.0'
  pod 'SnapKit', '~> 5.0.0'
  pod 'Swinject', '~> 2.7'
  pod 'SwinjectAutoregistration', '~> 2.7'
  pod 'Kingfisher', '~> 7.1.2'

  # Network
  pod 'Moya/RxSwift', '~> 15.0.0'

  # Pods for your project
  target 'CATestTest' do
    
      pod 'RxSwift', '~> 6.2.0'

      pod 'RxTest'
      pod 'Nimble'
  end
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        if target.name == "Nimble"
            target.build_configurations.each do |config|
                xcconfig_path = config.base_configuration_reference.real_path
                xcconfig = File.read(xcconfig_path)
                new_xcconfig = xcconfig.sub('lswiftXCTest', 'lXCTestSwiftSupport')
                File.open(xcconfig_path, "w") { |file| file << new_xcconfig }
            end
        end
    end
end
