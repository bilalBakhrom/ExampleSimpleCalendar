
  spec.name         = "SimpleCalendar"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of SimpleCalendar."
  spec.description  = <<-DESC
                   DESC

  spec.homepage     = "http://EXAMPLE/SimpleCalendar"
  spec.license      = "MIT (example)"
  spec.author             = { "Bilal Bakhrom" => "bilalbakhrom@gmail.com" }

  spec.platform     = :ios
  spec.platform     = :ios, "9.0"

  spec.source       = { :git => "http://EXAMPLE/SimpleCalendar.git", :tag => "#{spec.version}" }
  spec.source_files  = "Classes", "Classes/**/*.{h,m}"
  spec.exclude_files = "Classes/Exclude"

  spec.public_header_files = "Classes/**/*.h"
  spec.resources = "Resources/*.png"

end
