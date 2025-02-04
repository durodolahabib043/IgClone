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
            Color.white
            ScrollView(.vertical) {
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 10) {
                        ForEach(homeViewModel.user ) { user in
                            storyScroll(user: user)
                        }
                    }
                    .padding()
                }
                .scrollIndicators(.hidden)
                
                LazyVStack(spacing: 10) {
                    ForEach(homeViewModel.post ) { post in
                       // storyScroll(user: user)
                        ZStack {
                            VStack {
                                header(post: post)
                                pageView(post: post)
                            }
                        }

                    }
                }
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
                
                ToolbarItem(placement: .principal) {
                    Text("Instagram").font(.title)
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        Print("camera tapped")
                    } label: {
                        Image(systemName: "camera")
                    }
                    
                }

                
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    @ViewBuilder
    private func pageView(post: Post) -> some View {
        TabView {
            ForEach(0..<post.images.count, id: \.self) { i in
                
                Image(uiImage: post.images[i])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 500)
                    .clipped()
                
            }
        }
        .tabViewStyle(.page)
       // .indexViewStyle(.page(backgroundDisplayMode: .always))
        .frame(height: 500)

    }
    
    @ViewBuilder
    private func header(post: Post) -> some View {
        HStack(spacing: 8) {
            ZStack {
                Circle()
                    .fill(.orange)
                Image(uiImage: post.user.profilePic)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .imageScale(.large)
                    .foregroundColor(.white.opacity(0.6))
                    .fontWeight(.black)
                    .clipShape(Circle())
                    .frame(width: 30)
            }
            .frame(width: 35)

            Text(post.user.username)
            Spacer()
            Image(systemName: "ellipsis")
        }
        .padding()
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

