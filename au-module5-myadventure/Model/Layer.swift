import Foundation

struct Layer {
    
    let id : Int
    let stateText : String
    let options : [LayerChoice]
    
    struct LayerChoice {
        let id : Int
        let stateText : String
        let nextLayer : Layer?
    }
}
	
