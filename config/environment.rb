# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# 유효성검사에서 오류가 나면 rails에서 자동으로 에러 필드를 만드는데 이것을 제거해주는 역할을 한다. 서버를 재시동해야 적용된다.
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html_tag.html_safe
end 

