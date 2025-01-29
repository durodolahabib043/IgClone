

import Foundation
import UIKit

struct User: Hashable,Identifiable {
    var id = UUID()
    var profilePic : UIImage
    var username: String
    var description: String
    var name : String
    var followers : [User]
    var following : [User]
    var posts: [Post]
    var stories: [Story]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(username.hashValue)
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.username == rhs.username
    }
    
}

