//
//  NetworkManager.swift
//  DogFacts
//
//  Created by Эмиль on 10.04.2022.
//
import Foundation

class NetworkManager {
    static var shared = NetworkManager()
    
    var facts: [FactAboutDoc] = []
    
    func fetchFacts() {
        guard let url = URL(string: "https://dog-facts-api.herokuapp.com/api/v1/resources/dogs?number=4") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                self.facts = try JSONDecoder().decode([FactAboutDoc].self, from: data)
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
}
