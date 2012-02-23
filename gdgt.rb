# A Liquid tag for Jekyll sites that allows you to embed a gdgt gadget list
# widget.
#
# Usage:
#   {% gdgt gdgt_username width height %}
#
# Example:
#   {% gdgt jonursenbach 500 350 %}
#
# Default Configuration (override in _config.yml):
#   gdgt:
#     show_list_count: true
#
# Author: Jon Ursenbach <jon@ursenba.ch>
# Source URL: https://github.com/jonursenbach/jekyll-gdgt
# License: MIT
class Gdgt < Liquid::Tag
  Syntax = /^\s*([^\s]+)(\s+(\d+)\s+(\d+)\s*)?/

  def initialize(tagName, markup, tokens)
    super

    if markup =~ Syntax then
      @config = Jekyll.configuration({})['gdgt'] || {}
      if @config['show_list_count'].nil? then
        @config['show_list_count'] = true
      end

      @username = $1

      if $2.nil? then
        @width = 300
        @height = 265
      else
        @width = $3.to_i
        @height = $4.to_i
      end
    else
      raise "No gdgt username provided in the \"gdgt\" tag"
    end
  end

  def render(context)
    <<EOS
<script type="text/javascript" src="http://api.gdgt.com/js/widget/gadgetlist.js">
  /** Empty comment block because Liquid likes to self-close empty script tags. **/
</script>
<script>
gdgt.gadgetListWidget({
  user: '#{@username}',
  width: #{@width},
  height: #{@height},
  showCount: #{@config['show_list_count']}
});
</script>
EOS
  end

  Liquid::Template.register_tag "gdgt", self
end
