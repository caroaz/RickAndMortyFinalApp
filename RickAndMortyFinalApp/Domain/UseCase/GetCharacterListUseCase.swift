struct GetCharacterListUseCase {
    private let characterListRepository: CharactersRepository
    
    init(characterListRepository: CharactersRepository) {
        self.characterListRepository = characterListRepository
    }
    
    func execute(onCompletion: @escaping (Result<[Characters] , DomainError>) -> Void) {
        characterListRepository.fetchCharactersList { characters in
            onCompletion(characters)
        }
    }

}
