# spec/javascripts/support/jasmine_config.rb
# when jasmine starts the server out-of-process, it needs this in order to be able to invoke the asset tasks
unless Object.const_defined?(:Rake)
  require 'rake'
  load File.expand_path('../../../../Rakefile', __FILE__)
end

module Jasmine
  class Config

    def js_files(spec_filter = nil)
      generated_files_directory = File.expand_path("../../generated", __FILE__)
      rm_rf generated_files_directory, :secure => true
      FileUtils.mkdir_p(generated_files_directory+"/assets")
      
      precompile_app_assets
      compile_jasmine_javascripts

      # this is code from the original jasmine config js_files method - you could also just alias_method_chain it
      spec_files_to_include = spec_filter.nil? ? spec_files : match_files(spec_dir, [spec_filter])
      src_files.collect {|f| "/" + f } + helpers.collect {|f| File.join(spec_path, f) } + spec_files_to_include.collect {|f| File.join(spec_path, f) }
    end

    private

    # this method compiles all the same javascript files your app will
    def precompile_app_assets
      puts "Precompiling assets..."

      # Hack: needed to preserve the 'app' namespace, else
      # actionpack-3.1.0.rc6/lib/sprockets/assets.rake would run "rake assets:precompile"
      # see :precompile task therein
      ENV["RAILS_GROUPS"] = 'assets'
      ENV["RAILS_ENV"] = 'development'
      
      # In the mountable engine, all app rake tasks have been namespaced under "app"
       # make sure the Rails environment is loaded
      ::Rake.application['environment'].invoke

      # Rails 3.1 final stores the precompiled assets in the following path:
      # target = Pathname.new(File.join(Rails.public_path, config.assets.prefix))
      # (code taken from actionpack-3.1.0/lib/sprockets/assets.rake)
      # In the gem, Rails.public_path will point to the dummy_app's public path.
      # We need to set this such that the precompiled assets wind up in our spec directory.
      ::Rails.application.config.assets.prefix = "../spec/javascripts/generated/assets"
      ::Rails.application.config.assets.manifest = Rails.root.join("spec/javascripts/generated/assets")
      # Note: we use 'execute' rather than 'invoke' for the following commands,
      # because invoke will only run once, but execute runs every time.
      ::Rake.application['assets:clean'].execute
      
      # once the assets have been cleared, recompile them into the spec directory
      ::Rake.application['assets:precompile'].execute      
    end

    # this method compiles all of the spec files into js files that jasmine can run
    def compile_jasmine_javascripts
      puts "Compiling jasmine coffee scripts into javascript..."
      root = File.expand_path("../../models", __FILE__)
      destination_dir = File.expand_path("../../generated/specs", __FILE__)

      glob = File.expand_path("**/*.js.coffee", root)

      Dir.glob(glob).each do |srcfile|
        srcfile = Pathname.new(srcfile)
        destfile = srcfile.sub(root, destination_dir).sub(".coffee", "")
        FileUtils.mkdir_p(destfile.dirname)
        File.open(destfile, "w") {|f| f.write(CoffeeScript.compile(File.new(srcfile)))}
      end
    end

  end
end


# Note - this is necessary for rspec2, which has removed the backtrace
module Jasmine
  class SpecBuilder
    def declare_spec(parent, spec)
      me = self
      example_name = spec["name"]
      @spec_ids << spec["id"]
      backtrace = @example_locations[parent.description + " " + example_name]
      parent.it example_name, {} do
        me.report_spec(spec["id"])
      end
    end
  end
end
