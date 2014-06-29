-- Lua webmock library
local webmock = {}
local http = require("socket.http")

function webmock.stub_request(url, mock_response)
  http.request = function(url)
    return(mock_response or true)
  end
end

return webmock
