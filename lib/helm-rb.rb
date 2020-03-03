module HelmRb
  autoload :CLI, 'helm-rb/cli'

  def self.executable
    @path ||= begin
      pattern = File.expand_path(File.join('..', 'vendor', 'helm*'), __dir__)
      Dir.glob(pattern).first
    end
  end
end
