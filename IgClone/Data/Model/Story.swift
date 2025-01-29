
import Foundation
import UIKit

struct Story: Identifiable {
    var id = UUID()
    var user: User
    var image : UIImage
    var postTime: Date
    var watched: Bool
}
