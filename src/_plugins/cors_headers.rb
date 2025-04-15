Jekyll::Hooks.register :site, :after_init do |site|
  require 'webrick'
  require 'webrick/httputils'

  module WEBrick::HTTPServlet
    class FileHandler < AbstractServlet
      alias old_do_GET do_GET

      def do_GET(req, res)
        old_do_GET(req, res)
        res.header['Access-Control-Allow-Origin'] = '*'
        res.header['Access-Control-Allow-Methods'] = 'GET, OPTIONS'
        res.header['Access-Control-Allow-Headers'] = '*'
      end
    end
  end
end
