# Safety net: rewrite internal `.md` links to their rendered `.html` URLs.
# READMEs and section pages often link sibling `.md` files; Jekyll renders them
# as `.html`, so pointing at the raw markdown 404s.
Jekyll::Hooks.register [:pages, :documents], :post_render do |item|
  out = item.output
  next unless out.include?(".md")

  item.output = out.gsub(/(href|src)="([^"]*?\.md)([#?][^"]*)?"/) do
    attr = Regexp.last_match(1)
    path = Regexp.last_match(2)
    tail = Regexp.last_match(3).to_s
    if path =~ %r{\A(?:https?://|//|mailto:|tel:|javascript:|data:|ftp:)} || path.start_with?("#", "?") || path =~ %r{\A[a-zA-Z]+:}
      %(#{attr}="#{path}#{tail}")
    else
      %(#{attr}="#{path.sub(/\.md\z/, "")}.html#{tail}")
    end
  end
end