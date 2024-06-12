

import Foundation

/// Describes information related to the api's current rate limit.
public struct APIRateLimit: Decodable {
    /// The current limit.
    public let limit: Int
    
    /// The rate limit remaining.
    public let remaining: Int

    /// The time offset from UTC when the rate limit will reset, and a request may be retried.
    public let reset: TimeInterval
    
    /// The calculated delay from the reset limit and the date header.
    public let delay: TimeInterval?
    
    init?(with httpHeaders: [AnyHashable: Any]) {
        guard let rateLimitString = httpHeaders["x-rate-limit-limit"] as? String,
              let rateLimit = Int(rateLimitString),
              let remainingString = httpHeaders["x-rate-limit-remaining"] as? String,
              let remaining = Int(remainingString),
              let resetString = httpHeaders["x-rate-limit-reset"] as? String,
              let reset = TimeInterval(resetString),
              let dateString = httpHeaders["Date"] as? String,
              let date = httpDateFormatter.date(from: dateString)
        else {
            return nil
        }
        
        self.limit = rateLimit
        self.remaining = remaining
        self.reset = reset
        
        if remaining <= 0 {
            let calculatedDelay = reset - date.timeIntervalSince1970
            self.delay = max(calculatedDelay, TimeInterval(1))
        } else {
            self.delay = nil
        }
    }
}
