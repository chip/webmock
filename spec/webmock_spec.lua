webmock = require 'webmock'
http = require 'socket.http'

describe("webmock.stub_request", function()

  it("returns false when not stubbed", function()
    local url = "chipcastle.com"
    local response, status_code, headers, status = http.request(url)
    assert.is.falsy(response)
  end)

  it("returns true when stubbed", function()
    local url = "github.com"
    webmock.stub_request(url)
    local response, status_code, headers, status = http.request(url)
    assert.is.truthy(response)
  end)

  it("returns data when stubbed with data", function()
    local url = "github.com"
    webmock.stub_request(url, "foo")
    local response, status_code, headers, status = http.request(url)
    assert.same(response, "foo")
  end)
end)
