require_relative './canvas-blueprint-tool/canvas_interface'

class CanvasBlueprintTool

  def initialize(options)
    case options[:mode]
    when 'version'
      puts VERSION
    when 'associate'
      CanvasInterface.associate(options)
    when 'publish'
      CanvasInterface.publish(options)
    else
      puts VERSION
    end
  end
end