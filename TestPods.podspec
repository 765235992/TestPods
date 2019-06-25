

Pod::Spec.new do |spec|


  spec.name         = "TestPodsA"
  spec.version      = "0.0.1"
  spec.summary      = "测试使用"
  spec.description  = "测试一下"
  spec.homepage     = "https://www.jianshu.com"
spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }

	  spec.author             = { "Jone" => "765235992@qq.com" }

 spec.platform     = :ios, "8.0"
  spec.ios.deployment_target   = "8.0"
  spec.source       = { :git => "https://github.com/765235992/TestPods.git", :tag => spec.version }
   spec.source_files  = "Classes", "Classes/**/*.{h,m}"
   spec.public_header_files = "Classes/**/*.h"



   spec.frameworks              = "Foundation", "UIKit"


end
