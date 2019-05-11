
use_frameworks!

target 'GitHub' do
# Comment the next line if you're not using Swift and don't want to use dynamic frameworks

pod 'SkyFloatingLabelTextField'

pod 'Alamofire'
pod 'SwiftyJSON'
pod 'AlamofireNetworkActivityIndicator'
pod 'SDWebImage'

post_install do |installer|
installer.pods_project.build_configurations.each do |config|
config.build_settings.delete('CODE_SIGNING_ALLOWED')
config.build_settings.delete('CODE_SIGNING_REQUIRED')
end
end


end
