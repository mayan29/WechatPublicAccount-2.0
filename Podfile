source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
inhibit_all_warnings!

target 'WechatPublicAccount 2.0' do
pod 'SDWebImage', '~> 5.0'
pod 'YYCategories'
pod 'MagicalRecord'
pod 'MJExtension'

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '10.0'
        end
    end
end
