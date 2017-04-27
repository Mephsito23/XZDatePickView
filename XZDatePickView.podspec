
Pod::Spec.new do |s|

  s.name         = "XZDatePickView"
  s.version      = "0.0.1"
  s.summary      = "A short description of XZDatePickView."

  s.description  = <<-DESC
		sadfasfasfas
                   DESC

  s.homepage     = "https://github.com/Mephsito23/XZDatePickView.git"

  s.license      = "MIT"

  s.author             = { "mephsito" => "xiezefu@outlook.com" }
  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/Mephsito23/XZDatePickView.git", :tag => "0.0.1" }

  s.source_files  =  "XZDatePickView/*.{h,m}"
  s.exclude_files = "Classes/Exclude"

  s.dependency "Masonry", "~> 1.0.2"

end
