import UIKit

var greeting = "Hello, playground"

enum Pet: String{
    case dog = "🐶"
    case cat = "🐱"
    case mouse = "🐭"
    case parrot = "🦜"
    case turtle = "🐢"
    
    var type: String{
        switch self{
        case .dog, .cat, .mouse: return "mamifero"
        case .parrot: return "ave"
        case .turtle: return "reptil"
        }
        
    }

    // Los inicializadores de los enums tienen que ser OPCIONALES
    init?(name: String){
        switch name{
        case "dog": self.init(rawValue: "🐶")
        case "cat": self.init(rawValue: "🐱")
        case "mouse": self.init(rawValue: "🐭")
        case "parakeet": self.init(rawValue: "🦜")
        case "turtle": self.init(rawValue: "🐢")
        default: return nil
        }
    }
    /* Este inicializador es personalizado, tiene como funcion pasarle como parámetro una cadena de caracteres en lugar de un emoji del animal en especial */
}

let myPet = Pet.dog.type
let myBird = Pet.parrot.type
let myReptile = Pet.turtle.type

let myDog = Pet(name: "dog")
