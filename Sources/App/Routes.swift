import Vapor
import Foundation

extension Droplet {
    
    func setupRoutes() throws {
        
        get("/") { _ in
            return try self.view.make("index.html")
        }

        get("architecture") { req in
            let generator = ArchitectureGenerator.shared
            
            let minWords: UInt32 = 3
            let maxWords: UInt32 = 5

            #if os(Linux)
                srandom(UInt32(time(nil)));
                let n = Int(random() % (Int(maxWords) - Int(minWords))) + Int(minWords);
            #else
                let n = Int(arc4random_uniform(maxWords - minWords) + minWords)
            #endif
            
            let (name, initialism) = generator.makeRandomArchitecture(from: generator.words, with: n)
            
            var json = JSON()
            
            try json.set("name", name)
            try json.set("initialism", initialism)
            
            return json
        }
        
    }
    
}
