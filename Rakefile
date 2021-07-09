require 'bundler/setup'
require 'rspec/core/rake_task'
require 'fileutils'

DISTRIBUTIONS = [
  { rb_platform: 'x86_64-darwin', filename: 'darwin-amd64.tar.gz' },
  { rb_platform: 'arm64-darwin',  filename: 'darwin-arm64.tar.gz'},
  { rb_platform: 'x86_64-linux',  filename: 'linux-amd64.tar.gz' },
  { rb_platform: 'arm-linux',     filename: 'linux-arm.tar.gz' },
  { rb_platform: 'arm64-linux',   filename: 'linux-arm64.tar.gz' },
  { rb_platform: 'i386-linux',    filename: 'linux-386.tar.gz' },
  { rb_platform: 'ppc64le-linux', filename: 'linux-ppc64le.tar.gz' },
  { rb_platform: 's390x-linux',   filename: 'linux-s390x.tar.gz' },
  { rb_platform: 'x64-mswin64',   filename: 'windows-amd64.zip' }
]

task :build do
  require 'rubygems/package'
  require 'open-uri'
  require 'helm-rb/version'

  FileUtils.mkdir_p('pkg')

  DISTRIBUTIONS.each do |distro|
    FileUtils.rm_rf('vendor')
    FileUtils.mkdir('vendor')

    url = "https://get.helm.sh/helm-v#{HelmRb::HELM_VERSION}-#{distro[:filename]}"
    ext = distro[:filename][distro[:filename].index('.')..-1]
    distro_name = distro[:filename].chomp(ext)
    archive = "helm#{ext}"
    File.write(archive, URI.open(url).read)
    FileUtils.mkdir('helm')
    system("tar -C helm -xzvf #{archive}")
    FileUtils.rm(archive)

    Dir.glob(File.join('helm', distro_name, 'helm*')).each do |exe|
      system("chmod +x #{exe}")
      FileUtils.cp(exe, 'vendor')
    end

    FileUtils.rm_rf('helm')

    gemspec = eval(File.read('helm-rb.gemspec'))
    gemspec.platform = distro[:rb_platform]
    package = Gem::Package.build(gemspec)
    FileUtils.mv(package, 'pkg')
  end
end

task default: :spec

desc 'Run specs'
RSpec::Core::RakeTask.new do |t|
  t.pattern = './spec/**/*_spec.rb'
end
