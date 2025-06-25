import Foundation

struct AdventureLogic {
    
        let endStates = [
            "SUCCESS! You slayed the beast and found the guarded treasure!",
            "FAIL! A giant gorgon opened the door and ate you right up...",
            "FAIL! You wimped out and lost the family farm for lack of treasure...",
            "FAIL! A giant gorgon was lurking in darkness and ate you right up...",
            "FAIL! What a silly idea! You've been eaten in half by a gorgon..."
        
        ]
                     
                     
        let begin: Layer = {
        
        let start = Layer(id: 0, stateText: "New Game", options: [ ])
        
        
        let win = Layer(id: 0, stateText: "SUCCESS! You slayed the beast and found the guarded treasure!", options: [
            .init(id: 0, stateText: "Restart Game", nextLayer: start),
            .init(id: 1, stateText: "Restart Game", nextLayer: start)        ])
            
        let loseA = Layer(id: 1, stateText: "FAIL! A giant gorgon opened the door and ate you right up...", options: [
            .init(id: 0, stateText: "Restart Game", nextLayer: start),
            .init(id: 1, stateText: "Restart Game", nextLayer: start)        ])
        
        let loseB = Layer(id: 1, stateText: "FAIL! A giant gorgon was lurking in darkness and ate you right up...", options: [
            .init(id: 0, stateText: "Restart Game", nextLayer: start),
            .init(id: 1, stateText: "Restart Game", nextLayer: start)        ])
        
        let loseC = Layer(id: 1, stateText: "FAIL! You wimped out and lost the family farm for lack of treasure...", options: [
            .init(id: 0, stateText: "Restart Game", nextLayer: start),
            .init(id: 1, stateText: "Restart Game", nextLayer: start)        ])
        
        let loseD = Layer(id: 1, stateText: "FAIL! What a silly idea! You've been eaten in half by a gorgon...", options: [
            .init(id: 0, stateText: "Restart Game", nextLayer: start),
            .init(id: 1, stateText: "Restart Game", nextLayer: start)        ])
            
        let layerThreeA = Layer(id: 0, stateText: "You surprised a gorgon and caught him off guard", options: [
            .init(id: 0, stateText: "Attack!", nextLayer: win),
            .init(id: 1, stateText: "Negotiate with this beast", nextLayer: loseD)
        ])
            
        let layerThreeB = Layer(id: 0, stateText: "You've hit what feels like a door", options: [
            .init(id: 0, stateText: "Try to open it", nextLayer: loseB),
            .init(id: 1, stateText: "Knock", nextLayer: loseD)
        ])
            
        let layerTwoA = Layer(id: 0, stateText: "The light reveals a door at the end of a long hallway", options: [
            .init(id: 0, stateText: "Knock on the door", nextLayer: loseA),
            .init(id: 1, stateText: "Kick the door in", nextLayer: layerThreeA)
        ])
            
        let layerTwoB = Layer(id: 0, stateText: "A low rumble is heard deep in the darkness", options: [
            .init(id: 0, stateText: "Walk forward anyway", nextLayer: layerThreeB),
            .init(id: 1, stateText: "Get out fast!", nextLayer: loseC)
        ])
        
        let layerOne = Layer(id: 0, stateText: "You've stumbled upon a dark cavern. There could be treasure!", options: [
            .init(id: 0, stateText: "Light a flare", nextLayer: layerTwoA),
            .init(id: 1, stateText: "Shout \"Hello, anyone home?!\"", nextLayer: layerTwoB)
        ])

        return layerOne
    }()
}
