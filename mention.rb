users =  [ '@shinyatto', '@shinyatto_jp', '@s']
content = '@shinyattoは囲みあり、@shinyatto_jpも囲みあり、@sもリンクあり、@shinyaには囲みなし。@shinyatto_jpに囲みあり。@sも囲みあり。'
content += ' ' #文末だった場合
display_content = ''
mention = ''

content.chars do |char|
  tmp = mention + char
  if matcher = tmp.match(/\A@{1}[0-9A-Za-z_-]*\Z/)
    mention += char
  else
    if mention == "@"
      display_content += "@" + char
    elsif mention.size > 1
      mention = '<span>' + mention + '</span>' if users.include?(mention)
      display_content += mention
    else
      display_content += char
    end
    mention = '';
  end
end

puts display_content

