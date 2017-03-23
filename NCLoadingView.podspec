Pod::Spec.new do |s|
  s.name = 'NCLoadingView'
  s.version = '0.1.0'
  s.license = 'MIT'
  s.summary = '一个仿招行信用卡客户端掌上生活的加载框.'
  s.homepage = 'https://github.com/LINAICAI/NCLoadingView'
  s.authors = { 'NAICAI LI' => 'linaicai2012@gmail.com' }
  s.source = { :git => 'https://github.com/NCLoadingView/NCLoadingView.git', :tag => '0.1.0' }
  s.dependency 'SnapKit'
  s.ios.deployment_target = '8.0'
  s.source_files = 'source/*.swift'
  s.requires_arc = true
end
