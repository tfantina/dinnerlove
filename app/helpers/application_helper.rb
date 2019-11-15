module ApplicationHelper

  def show_svg(name)
    File.open("app/assets/images/icons/#{name}.svg", "rb") do |file|
      raw file.read
    end
  end
end
