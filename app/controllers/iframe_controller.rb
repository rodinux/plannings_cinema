class IframeController < ApplicationController
  def iframe_action
    response.headers["X-FRAME-OPTIONS"] = "ALLOW-FROM ecranvillage-dev.vivarais.net"
    render_something
  end
end