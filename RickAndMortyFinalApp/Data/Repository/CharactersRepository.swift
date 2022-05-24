//centralizar el acceso a la información 
protocol CharactersRepository {
    func fetchCharactersList(onCompletion: @escaping (Result<[Characters], DomainError>) -> Void)
    
}
