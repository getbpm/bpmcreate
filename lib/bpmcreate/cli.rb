require 'thor'
require 'open-uri'

module BPMCreate
  class CLI < Thor

    desc "create URL", "create package from URL"
    method_option :name, :type => :string, :required => true
    method_option :target, :type => :string # default set later
    method_option :version, :type => :string, :default => "1.0"
    method_option :author, :type => :string, :default => "John Doe"
    method_option :description, :type => :string #default set later
    method_option :summary, :type => :string #default set later
    method_option :homepage, :type => :string, :default => "http://github.com/getbpm/bpm"
    def create(url)
      opts = Thor::CoreExt::HashWithIndifferentAccess.new.merge(options) # clone/unfreeze
      opts[:target]      ||= File.join(Dir.pwd, opts[:name])
      opts[:description] ||= "#{opts[:name]} Package"
      opts[:summary]     ||= opts[:description]

      code = open(url).read

      Generator.new(self, opts, code).invoke_all
    end

  end
end
