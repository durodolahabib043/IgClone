
import Foundation

enum Screens: String, Identifiable, CaseIterable {
    var id: String { rawValue }
    case home, search, plus, reels, profile
    
    var title: String {
        switch self {
        case .home:
           return NSLocalizedString("Home", comment: "")
        case .search:
            return NSLocalizedString("Explore", comment: "")
        case .plus:
            return NSLocalizedString("Watchlist", comment: "")
        case .reels:
            return NSLocalizedString("Reels", comment: "")
        case .profile:
            return NSLocalizedString("profile", comment: "")
        }
    }
}
