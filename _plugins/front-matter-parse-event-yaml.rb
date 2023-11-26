Jekyll::Hooks.register :posts, :pre_render do |post, payload|
  docExt = post.extname.tr('.', '')
  if payload['site']['markdown_ext'].include? docExt
    if payload.page['eventcard']
        newContent = YAML.load(payload.page['eventcard'])
        payload.page['eventcard'] = newContent
    end
  end
end
