 
Pod::Spec.new do |s|
 

  s.name         = "LKDBHelper+Transaction"
  s.version      = "1.0.2"
  s.summary      = "LKDBHelper 扩展修改了一下，简化表创建"
 
  s.homepage     = "https://github.com/junhaiyang/LKDBHelper-Transaction"
 
  s.license      = "MIT"
 
  s.author             = { "yangjunhai" => "junhaiyang@gmail.com" } 
  s.ios.deployment_target = "6.0" 
  
  s.source = { :git => 'https://github.com/junhaiyang/LKDBHelper-Transaction.git' , :tag => '1.0.2'} 
 
  s.requires_arc = true
   
  s.source_files = '*.{h,m,mm}'  
  
  s.compiler_flags = '-w'
  
  s.exclude_files = "MyTest.{h,m}"
  
  s.dependency 'LKDBHelper'

end
