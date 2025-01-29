//
//  HomeView.swift
//  IgClone
//
//  Created by Habib Durodola on 1/28/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var homeViewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            Color.cyan
            ScrollView() {
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 10) {
                        ForEach(homeViewModel.user ?? []) { user in
                            storyScroll(user: user)
                        }
                    }
                    .padding()
                }
                .scrollIndicators(.hidden)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button {
                            Print("heart tapped")
                        } label: {
                            Image(systemName: "heart")
                        }
                        
                        Button {
                            Print("message tapped")
                        } label: {
                            Image(systemName: "message")
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private func storyScroll(user: User) -> some View {
        VStack{
            Button {

            } label: {
                ZStack {
                    Circle()
                        .fill(.red)
                    Image(uiImage: user.profilePic)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .imageScale(.large)
                        .foregroundColor(.white.opacity(0.6))
                        .fontWeight(.black)
                        .clipShape(Circle())
                }
                .frame(width: 60)
            }
            Text(user.name)
        }

    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}

