# frozen_string_literal: true
module FakeS3Server
  class << self
    def start
      Dir.mktmpdir do |rootdir|
        __start__(rootdir)
      end
      set_dummy_s3_config
    end

    def stop
      rootdir = Glint::Server.info[:fakes3][:root]
      FileUtils.remove_entry_secure(rootdir) if Dir.exist? rootdir
    end

    def restart
      stop
      start
    end

    private

    def __start__(rootdir)
      server = Glint::Server.new(nil, signals: [:INT]) do |port|
        exec "fakes3 -p #{port} -r #{rootdir}",
             out: '/dev/null', err: '/dev/null'
        exit 0
      end

      server.start

      Glint::Server.info[:fakes3] = {
        address: "127.0.0.1:#{server.port}",
        root: rootdir
      }
    end

    def set_dummy_s3_config
      Aws.config[:s3] = {
        access_key_id: 'YOUR_ACCESS_KEY_ID',
        secret_access_key: 'YOUR_SECRET_ACCESS_KEY',
        endpoint: "http://#{Glint::Server.info[:fakes3][:address]}/",
        force_path_style: true
      }
    end
  end
end

RSpec.configure do |config|
  config.before :suite do
    FakeS3Server.start
  end

  config.after :suite do
    FakeS3Server.stop
  end
end
