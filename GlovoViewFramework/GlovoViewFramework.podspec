
Pod::Spec.new do |spec|

spec.name         = "GlovoViewFramework"
spec.version      = '1.0.0'
spec.summary      = "A basic replica of Glovo Home animation"

spec.description  = "the project relies on ALRadialMenu to get the circular layout , and it contains the same animation as Glovo's home animation"

spec.homepage     = "https://github.com/hilalalhakani/GlovoViewFramework"

spec.license      = 'MIT'

spec.author       = { "Hilal Al Hakkani" => "hilalalhakani@gmail.com" }
spec.platform     = :ios, "10.0"
spec.swift_version = "4.0"

spec.source       = { :git => "https://github.com/hilalalhakani/GlovoViewFramework.git", :tag => '1.0.0' }

spec.source_files  = "GlovoViewFramework/**/*"

end



