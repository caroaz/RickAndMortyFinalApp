
//consumir el servicio rest
protocol APIRest: AnyObject {
    func fetchData(onCompletion: @escaping (  Result< [Characters], APIError>) -> Void)
   
}
