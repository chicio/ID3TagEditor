
Pod::Spec.new do |s|

  s.name         = "ID3TagEditor"
  s.version      = "5.4.0"
  s.summary      = "A swift library to read and modify ID3 Tag of any mp3 file"
  s.description  = <<-DESC
A swift library to read and modify ID3 Tag of any mp3 file.
                   DESC
  s.homepage     = "https://github.com/chicio/ID3TagEditor"
  s.screenshots  = "https://raw.githubusercontent.com/chicio/ID3TagEditor/master/Screenshots/01-example.png"
  s.license      = { :type => "MIT", :file => "LICENSE.md" }
  s.author             = { "chicio" => "fabrizio.duroni@gmail.com" }
  s.social_media_url   = "https://github.com/chicio"
  s.source       = { :git => "https://github.com/chicio/ID3TagEditor.git", :tag => "#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'
  s.tvos.deployment_target = '15.0'
  s.watchos.deployment_target = '8.0'

  s.source_files  = "Source", "Source/**/*.{h,m}", "Source/**/*.swift"
  s.swift_version = '6.0'

end
