//
//  WordOfTheDay.swift
//  Clapingo Assignment
//
//  Created by Palak Satti on 10/03/24.
//

import Combine
import Foundation

class WordOfTheDayViewModel: ObservableObject {
    @Published var wordOfTheDay: String = ""
    @Published var meaning: String = ""

    func fetchWordOfTheDay() {
        let urlString = "https://api.quotable.io/random"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Quote.self, from: data) {
                    DispatchQueue.main.async {
                        self.wordOfTheDay = decodedResponse.wordOfTheDay
                        self.meaning = decodedResponse.content
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}


