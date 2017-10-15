//
//  ArchitectureGenerator.swift
//  App
//
//  Created by Guilherme Rambo on 20/09/17.
//

import Foundation

final class ArchitectureGenerator {
    
    static let shared: ArchitectureGenerator = ArchitectureGenerator()
    
    let words = [
        "Model",
        "View",
        "Controller",
        "Interactor",
        "Presenter",
        "Store",
        "Helper",
        "Singleton",
        "View-model",
        "Functional",
        "Entity",
        "Router"
    ]
    
    func makeRandomArchitecture(from wordList: [String], with elements: Int = 4) -> (name: String, initialism: String) {
        var availableWords = wordList
        var selectedWords: [String] = []
        var initialism: String = ""
        
        (0..<elements).forEach { _ in
            #if os(Linux)
                srandom(UInt32(time(nil)));
                let n = Int(random() % availableWords.count);
            #else
                let n = Int(arc4random_uniform(UInt32(availableWords.count)))
            #endif
            
            let word = availableWords.remove(at: n)
            
            selectedWords.append(word)
            initialism.append(String(word[word.startIndex]))
        }
        
        return (name: selectedWords.joined(separator: " "), initialism: initialism)
    }

    
}
