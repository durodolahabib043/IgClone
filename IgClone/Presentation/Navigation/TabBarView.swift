

import SwiftUI
/// A TabBar for switching views, only used on iPhone.
struct TabBarView: View {
    @AppStorage("lastTabSelected") private var tabSelection: Screens?
   // var persistence = PersistenceController.shared
    private var selectedTab: Binding<Screens> {
        return .init {
            return tabSelection ?? .home
        } set: { newValue in
            if newValue == tabSelection {
                switch newValue {
                case .home:
                    if !homePath.isEmpty {
                        homePath = .init()
                    }
                case .search:
                    if !searchPath.isEmpty {
                        searchPath = .init()
                    }
                case .plus:
                    if !plus.isEmpty {
                        plus = .init()
                    }
                case .reels:
                    if !reelsPath.isEmpty {
                        reelsPath = .init()
                    }
                case .profile:
                    if !profilePath.isEmpty {
                        profilePath = .init()
                    } else {
                        shouldOpenOnSearchField = true
                    }
                default: return
                }
            }
            tabSelection = newValue
        }
    }
    @State private var homePath: NavigationPath = .init()
    @State private var profilePath: NavigationPath = .init()
    @State private var plus: NavigationPath = .init()
    @State private var searchPath: NavigationPath = .init()
    @State private var reelsPath: NavigationPath = .init()
    @State private var shouldOpenOnSearchField = false
    var body: some View  {
        details

    }

    private var details: some View {
        TabView(selection: selectedTab) {
            NavigationStack(path: $homePath) {
                Text("Home")
            }
            .tag(Screens.home)
            .tabItem { Label("", systemImage: "house") }
            
            NavigationStack(path: $searchPath) {
                Text("search")
            }
            .tag(Screens.search)
            .tabItem { Label("", systemImage: "magnifyingglass") }
            
            NavigationStack(path: $plus) {
                Text("Plus")
            }
            .tabItem { Label("", systemImage: "plus.square") }
            .tag(Screens.plus)
            
            NavigationStack(path: $reelsPath) {
                Text("Reels")
            }
            .tag(Screens.reels)
            .tabItem { Label("", systemImage: "play.square") }
            
            NavigationStack(path: $profilePath) {
                Text("profilePath")
            }
            .tag(Screens.profile)
            .tabItem { Label("", systemImage: "person.crop.circle") }
        }
     
    }
}
