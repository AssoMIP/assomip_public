Jekyll::Hooks.register :documents, :pre_render do |document, payload|
  docExt = document.extname.tr('.', '')
  # only process if we deal with a markdown file
  if payload['site']['markdown_ext'].include? docExt
    newContent = document.content.gsub(/\[tabs[^\]]*\]/, '<div class="accordion" id="accordionExample">')
    newContent = newContent.gsub(/\[\/tabs[^\]]*\]/, '</div>')
    newContent = newContent.gsub(/\[tab title="([^\]]*)"\]/, '{% include accordion.html title="\1" %}')
    newContent = newContent.gsub(/\[\/tab[^s\]]*\]/, '</div></div></div>')
    document.content = newContent
  end
end
