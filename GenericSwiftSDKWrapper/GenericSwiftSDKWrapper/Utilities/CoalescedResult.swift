
import Foundation

final class CoalescedResult<T> {
    private var completionHandlers: [(T) -> Void] = []
    
    func add(_ completion: @escaping (T) -> Void) {
        completionHandlers.append(completion)
    }
    
    func start(_ operation: ((T) -> Void) -> Void) {
        operation { result in
            self.finish(result)
        }
    }

    func finish(_ result: T) {
        completionHandlers.forEach { completion in
            completion(result)
        }
    }
}
