//
//  HomeView.swift
//  IgClone
//
//  Created by Habib Durodola on 1/28/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.cyan
            ScrollView() {
                ScrollView(.horizontal) {
                    
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
            }
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

