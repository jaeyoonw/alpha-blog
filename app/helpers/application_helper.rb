module ApplicationHelper
  def gravatar_for(user, options = { size: 80 })
    email_address = user.email.downcase   # Alpha Blog에 등록한 email이 gravatar에 등록되잇으면 gravatar의 이미지를 보여준다. 
    hash = Digest::MD5.hexdigest(email_address)
    size = options[:size]
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "rounded shadow mx-auto d-block")
  end
end

