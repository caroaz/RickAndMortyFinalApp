
import Foundation
//class MockSession: URLSession {
//
//    var completionHandler:((NSData?, URLResponse?, NSError?) -> Void)?
//
//    static var mockResponse: (data: NSData?, urlResponse: URLResponse?, error: NSError?)
//
//    override class func sharedSession() -> URLSession {
//        return MockSession()
//    }
//
//    override func dataTaskWithRequest(request: NSURLRequest, completionHandler: (NSData?, NSURLResponse?, NSError?) -> Void) -> NSURLSessionDataTask {
//        self.completionHandler = completionHandler
//        return MockTask(response: MockSession.mockResponse, completionHandler: completionHandler)
//    }
//
//    class MockTask: NSURLSessionDataTask {
//
//        typealias Response = (data: NSData?, urlResponse: NSURLResponse?, error: NSError?)
//        var mockResponse: Response
//        let completionHandler: ((NSData!, NSURLResponse!, NSError!) -> Void)?
//
//        init(response: Response, completionHandler:((NSData!, NSURLResponse!, NSError!) -> Void)?) {
//            self.mockResponse = response
//            self.completionHandler = completionHandler
//        }
//
//        override func resume() {
//            completionHandler!(mockResponse.data, mockResponse.urlResponse, mockResponse.error)
//        }
//
//    }
//}
