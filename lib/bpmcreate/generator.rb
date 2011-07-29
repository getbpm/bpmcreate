require 'thor'
require 'thor/group'

module BPMCreate
  class Generator < Thor::Group
    include Thor::Actions

    source_root File.expand_path("../templates", __FILE__)

    OPTS = [:name, :version, :description, :summary, :author, :homepage]
    attr_reader *OPTS
    attr_reader :code

    def initialize(thor, opts, code)
      super()
      @thor, @code = thor, code
      OPTS.each{|o| instance_variable_set("@#{o}", opts[o]) }
      self.destination_root = opts[:target]
    end

    def create_package_file
      template "package.json"
    end

    def create_lib_file
      create_file "lib/#{name}.js", code
    end

  end
end
