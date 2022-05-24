struct GetCharacterList {
    private let characterListRepository: CharacterListAPIRepository
    
    init(characterListRepository: CharacterListAPIRepository) {
        self.characterListRepository = characterListRepository
    }
    
    func execute(onCompletion: @escaping ([Characters]? , DomainError?) -> Void) {
        characterListRepository.fetchCharactersList { characters, error in
            onCompletion(characters, error)
        }
    }

}
