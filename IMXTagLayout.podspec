Pod::Spec.new do |s|
  s.name         = "IMXTagsFlowLayout"
  s.version      = "1.0.0"
  s.summary      = "Tag CollectionView Layout"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.homepage     = "https://github.com/PanZhow/IMXCollectionViewTagsFlowLayout.git"
  s.author             = { "zhoupanpan" => "2331838272@qq.com" }
  s.source       = { :git => "https://github.com/PanZhow/IMXCollectionViewTagsFlowLayout.git", :tag => "#{s.version}" }
  s.requires_arc = true
  s.platform     = :ios, '8.0'

  s.source_files  = 'IMXTagLayout/Layout/*.{h,m}'
  s.public_header_files = [
    'IMXTagLayout/Layout/*.{h}'
  ]

end
