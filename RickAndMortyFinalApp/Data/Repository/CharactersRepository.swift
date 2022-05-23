//centralizar el acceso a la información 
protocol CharactersRepository {
    func fetchCharactersList(onCompletion: @escaping ([Characters]? , DomainError?) -> Void)
    
}
