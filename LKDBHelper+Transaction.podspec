 
Pod::Spec.new do |s|
 

  s.name         = "LKDBHelper+Transaction"
  s.version      = "1.0.3"
  s.summary      = "LKDBHelper 扩展修改了一下，简化使用方式"
 
  s.homepage     = "https://github.com/junhaiyang/LKDBHelper-Transaction"
 
  s.license      = "MIT"
 
  s.author             = { "yangjunhai" => "junhaiyang@gmail.com" } 
  s.ios.deployment_target = "6.0" 
  
  s.source = { :git => 'https://github.com/junhaiyang/LKDBHelper-Transaction.git' , :tag => '1.0.3'} 
 
  s.requires_arc = true
  
  s.subspec 'Transaction' do |ds|
    
  	ds.source_files = '*.{h,m,mm}'   
    ds.exclude_files = "MyTest.{h,m}" 
    		 
  end
  
  s.subspec 'DYPersistence' do |ds|
    
        ds.dependency 'LKDBHelper+Transaction/Transaction'
  	     ds.source_files = 'DYPersistence/*.{h,m,mm}'  
    		 
  end
   
  
  s.compiler_flags = '-w'
  
  
  s.dependency 'LKDBHelper'

end
