Pod::Spec.new do |s|
  #验证方法1：pod lib lint CJMonitor.podspec --sources='https://github.com/CocoaPods/Specs.git,https://gitee.com/dvlproad/dvlproadSpecs' --allow-warnings --use-libraries --verbose
  #验证方法2：pod lib lint CJMonitor.podspec --sources=master,dvlproad --allow-warnings --use-libraries --verbose
  #提交方法： pod repo push dvlproad CJMonitor.podspec --sources=master,dvlproad --allow-warnings --use-libraries --verbose
  s.name         = "CJMonitor"
  s.version      = "0.0.2"
  s.summary      = "自定义的基础工具类"
  s.homepage     = "https://github.com/dvlproad/CJMonitor"
  s.license      = "MIT"
  s.author       = "dvlproad"

  s.description  = <<-DESC
                  - CJMonitor/CJLog：日志工具
                  - CJMonitor/CJAppLastUtil：APP上次信息+账号安全工具

                   A longer description of CJMonitor in Markdown format.

                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC

  # s.social_media_url   = "http://twitter.com/dvlproad"

  s.platform     = :ios, "9.0"

  s.source       = { :git => "https://github.com/dvlproad/CJMonitor.git", :tag => "CJMonitor_0.0.2" }
  # s.source_files  = "CJMonitor/*.{h,m}"
  # s.resources = "CJMonitor/**/*.{png}"
  s.frameworks = 'UIKit'

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

  s.subspec 'CJLog' do |ss|
    ss.source_files = "CJMonitor/CJLog/**/*.{h,m}"
    ss.dependency 'Masonry'
    ss.dependency 'CJBaseUIKit/UIView/CJDragAction' # CJLogSuspendWindow.h 用于控制log视图的弹出与隐藏的悬浮球需要依赖到
    ss.dependency 'CJGRKit/Extension'               # CJLogSuspendWindow.h 需要使用 #import <CJGRKit/UIView+CJKeepBounds.h>
  end

  # # 上次信息(账号安全)
  # s.subspec 'CJAppLastUtil' do |ss|
  #   ss.source_files = "CJMonitor/CJAppLastUtil/**/*.{h,m}"
  #   ss.dependency "SAMKeychain"
  # end


  # s.subspec 'CJManager' do |ss|
  # 	# AppDelegate瘦身
  #   ss.subspec 'CJModuleManager' do |sss|
  #     sss.source_files = "CJMonitor/CJManager/CJModuleManager/**/*.{h,m}"
  #     #sss.resources = "CJMonitor/CJManager/**/*.{png,xib}"
  #   end

  #   # 位置变化
  #   ss.subspec 'CJLocationChangeManager' do |sss|
  #     sss.source_files = "CJMonitor/CJManager/CJLocationChangeManager/**/*.{h,m}"
  #     sss.dependency "CJMonitor/CJDateUtil"
  #   end

  #   # 倒计时
  #   ss.subspec 'CJTimerManager' do |sss|
  #     sss.source_files = "CJMonitor/CJManager/CJTimerManager/**/*.{h,m}"
  #     #sss.resources = "CJMonitor/CJManager/**/*.{png,xib}"
  #   end

  #   ## 悬浮框管理器
  #   ss.subspec 'CJSuspendWindowManager' do |sss|
  #     sss.source_files = "CJMonitor/CJManager/CJSuspendWindowManager/**/*.{h,m}"
  #     #sss.resources = "CJMonitor/CJManager/**/*.{png,xib}"
  #   end
  # end

end
