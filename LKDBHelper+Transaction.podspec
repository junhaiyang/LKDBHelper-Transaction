 
Pod::Spec.new do |s|
 

  s.name         = "LKDBHelper+Transaction"
  s.version      = "1.0.1"
  s.summary      = "LKDBHelper 添加事物批处理"
 
  s.homepage     = "https://github.com/junhaiyang/LKDBHelper-Transaction"
 
  s.license      = "MIT"
 
  s.author             = { "yangjunhai" => "junhaiyang@gmail.com" } 
  s.ios.deployment_target = "6.0" 
  
  s.source = { :git => 'https://github.com/junhaiyang/LKDBHelper-Transaction.git' , :tag => '1.0.0'} 
 
  s.requires_arc = true
   
  s.source_files = '*.{h,m,mm}'  

end
