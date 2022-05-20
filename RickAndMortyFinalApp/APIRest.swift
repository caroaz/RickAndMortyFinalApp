protocol APIRest: AnyObject {
    func fetchData(onCompletion: @escaping ( [Characters]?, APIError?) -> Void)
   
}
