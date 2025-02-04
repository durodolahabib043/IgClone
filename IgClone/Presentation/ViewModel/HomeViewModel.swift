//
//  HomeViewModel.swift
//  IgClone
//
//  Created by Habib Durodola on 1/28/25.
//

import Foundation


class HomeViewModel : ObservableObject {
    @Published var user: [User]
    @Published var post : [Post] = []
    
    private let dataGenerator : DataGenerator
    
    init(user: [User] = [], dataGenerator: DataGenerator = DataGenerator()) {
        self.user = user
        self.dataGenerator = dataGenerator
        getUsers()
        getAllPost()
    }
    
    private func getUsers() {
        user = dataGenerator.getAllUsers()
    }
    
    func getAllPost(){
        post = dataGenerator.generatePostData()
    }

}
