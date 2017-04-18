

target 'WaterRemind' do
    use_frameworks!
    pod 'RealmSwift'
    pod 'EasyPeasy'
    pod 'SwiftyBeaver'
    pod 'YXWaveView'
    pod 'FontAwesome.swift'
end


post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
