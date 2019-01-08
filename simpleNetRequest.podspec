Pod::Spec.new do |s|
  s.name         = "simpleNetRequest"
  s.version      = "0.0.1"
  s.summary      = "简单网络请求"
  s.description  = <<-DESC
			非常简单的网络请求，当项目中与AFNetworking冲突的时候使用
                   DESC

  s.homepage     = "https://github.com/Gioures/simpleNetRequest"
  s.license      = "Apache-2.0"
  s.author             = { "Gioures" => "756119874@qq.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/Gioures/simpleNetRequest.git", :tag => "#{s.version}" }
  s.source_files  = "simpleNetRequest/NetWork/**"
end
