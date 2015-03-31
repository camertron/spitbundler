module Spitbundler
  class DependencyParser
    class << self

      def parse(lockfile)
        lockfile = parse_lockfile(lockfile)
        gems = gather_gems(lockfile)
        { gems: gems }
      end

      protected

      def gather_gems(lockfile)
        lockfile.specs.each_with_object([]) do |spec, ret|
          params = case spec.source
            when Bundler::Source::Rubygems
              rubygems_params(spec)
            when Bundler::Source::Git
              git_params(spec)
            when Bundler::Source::Path
              nil
          end

          if params
            ret << params.merge(name: spec.name, version: spec.version.to_s)
          end
        end
      end

      def rubygems_params(spec)
        { sources: spec.source.remotes.map(&:to_s), type: 'rubygems' }
      end

      def git_params(spec)
        {
          uri: spec.source.uri,
          ref: spec.source.ref,
          branch: spec.source.branch,
          type: 'git'
        }
      end

      def parse_lockfile(lockfile)
        Bundler::LockfileParser.new(
          File.read(lockfile)
        )
      end

    end
  end
end
