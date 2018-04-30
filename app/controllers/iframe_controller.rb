class IframeController < ApplicationController
  def iframe_action
    response.headers["X-FRAME-OPTIONS"] = "ALLOW-FROM ecranvillage.net"
    render_something
  end
end