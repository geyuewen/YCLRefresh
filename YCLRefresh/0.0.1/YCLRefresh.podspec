
Pod::Spec.new do |s|
  s.name             = 'YCLRefresh'
  s.version          = '0.0.1'
  s.summary          = '养车乐刷新控件'

  s.description      = '不需要太多解释'
  s.homepage         = 'https://github.com/geyuewen/YCLRefresh'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'geyuewen' => 'geyuewen1994@126.com' }
  s.source           = { :git => 'https://github.com/geyuewen/YCLRefresh.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'YCLRefresh/Classes/**/*'
  
   s.resource_bundles = {
     'YCLRefresh' => ['YCLRefresh/Assets/*.png']
   }

   s.dependency 'MJRefresh'
end
