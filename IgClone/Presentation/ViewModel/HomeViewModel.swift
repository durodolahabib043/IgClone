//
//  HomeViewModel.swift
//  IgClone
//
//  Created by Habib Durodola on 1/28/25.
//

import Foundation


class HomeViewModel : ObservableObject {
    @Published var user: [User]
    
    private let dataGenerator : DataGenerator
    
    init(user: [User] = [], dataGenerator: DataGenerator = DataGenerator()) {
        self.user = user
        self.dataGenerator = dataGenerator
        getUsers()
    }
    
    private func getUsers() {
        user = dataGenerator.getAllUsers()
    }

}
