@_exported import Html
import Vapor

extension Html.Node: ResponseEncodable {
    public func encodeResponse(for request: Request) -> EventLoopFuture<Response> {
        let response = Response(
            headers: ["content-type": "text/html; charset=utf-8"],
            body: .init(string: Html.render(self))
        )
        return request.eventLoop.future(response)
    }
}
