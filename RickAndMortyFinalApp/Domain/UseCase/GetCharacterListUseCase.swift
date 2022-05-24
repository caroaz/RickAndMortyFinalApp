struct GetCharacterListUseCase {
    private let characterListRepository: CharacterListAPIRepository
    
    init(characterListRepository: CharacterListAPIRepository) {
        self.characterListRepository = characterListRepository
    }
    
    func execute(onCompletion: @escaping (Result<[Characters] , DomainError>) -> Void) {
        characterListRepository.fetchCharactersList { characters in
            onCompletion(characters)
        }
    }

}
