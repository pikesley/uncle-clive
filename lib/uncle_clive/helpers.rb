module UncleClive
  CONFIG = YAML.load_file('config/config.yml') || {}

  module Helpers
    def cleave string, separator: '---'
      items = string.split separator
      return items.first if items.length == 1
      items
    end
  end
end
