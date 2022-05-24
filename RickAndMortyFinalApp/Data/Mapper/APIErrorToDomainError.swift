
import Foundation
class APIErrorToDomainError: Mapper<DomainError, APIError> {
    override func reverseMap(value: APIError) -> DomainError {
        return DomainError(description: value.message)
    }
}
