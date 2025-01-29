

import Foundation
import UIKit

struct Post: Identifiable {
    var id = UUID()
    var user: User
    var images : [UIImage]
    var likedUsers: [User]
    var caption: String
    var comments: [Comment]
    var liked : Bool
    var bookmarked: Bool
    var postTime: Date
}
