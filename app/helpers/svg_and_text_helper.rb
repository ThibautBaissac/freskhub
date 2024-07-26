module SvgAndTextHelper
  def svg_and_text(svg, text)
    content_tag(:span, class: "flex items-center gap-2 text-xl") do
      safe_join([render(svg), text])
    end
  end
end
