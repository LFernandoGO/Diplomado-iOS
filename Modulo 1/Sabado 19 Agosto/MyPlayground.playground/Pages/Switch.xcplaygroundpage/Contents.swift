//: [Previous](@previous)

import Foundation

// SWITCH : SIEMPRE TIENE QUE TENER UNA VALIDACION EJECUTABLE
let animal = "dog"

switch animal {
case "dog": print("🐶")
case "cat": print("🐱")
case "mouse": print("🐭")
case "bird": print("🦜")
default: break
}

// Caso compuesto
switch animal {
case "dog", "cat":
    print("A mi me gustan mucho de esos")
default: print("meh")
}

// Validacion de intervalos
let grade = 9
switch grade {
case ...5: print("Failed") // De 5 a menos infinito
case 6..<9: print("meh")
case 9: print("9 is great")
case 10: print("WOW")
default: print(":v")
}

// VALUE BINDING (Asignar a una variable un valor)
// Forzar avanzar a todos los cases sin que los valide
let color = (255,255,255)
switch color {
case (_,_,255):
    print("Max blue")
    fallthrough // Tiene que continuar pero ya no valida (un caso mas)
case (_,255,_): print("Max green") // El fallthrough solo llega hasta aqui
case (255,_,_): print("Max red")
default: break
}

// VALUE BINDING (Asignar a una variable un valor)
let color2 = (1,2,255)
switch color2 {
case (let r, let g, 255): print("red:\(r), green:\(g), max blue")
    // Las variables solo viven dentro de este case
case let (r,255,b): print("red:\(r), max green, blue:\(b)")
    // La declaracion de "let" o "var" se puede hacer fuera del parentesis
case let (255,g,b) where g < 255:
    print("Max red with green \(g) and blue \(b)")
default: break
}



//: [Next](@next)
