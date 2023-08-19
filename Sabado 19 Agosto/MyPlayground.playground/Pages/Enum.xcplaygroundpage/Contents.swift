//: [Previous](@previous)

import Foundation

// TIPOS DE PRIMERA CLASE, tiene que ser un único valor asignado
// Se nombran en upperCamelCase y siempre en singular
// Pueden conformar protocolos
// El tipo de dato por defecto es String, si es que no se pone

enum Pet: String {
    case dog = "🐶"
    case cat = "🐱"
    case mouse = "🐭"
    case parakeet = "🦜"
    case turtle = "🐢"
}

// Inicializar (Cuando no sé que existe)
let myPet = Pet(rawValue: "🐶")

// Inicializar de un caso en particular (Cuando sé que existe)
let myTurtle: Pet = .turtle

// Es lo mismo que el caso anterior
let myParakeet = Pet.parakeet

// Pueden ser utilizados con Switch (El mismo tipo todos los casos)
switch myPet {
case .dog: print("dog 🐶")
case .cat: print("cat 🐱")
case .mouse: print("mouse 🐭")
case .parakeet: print("parakeet 🦜")
case .turtle: print("turtle 🐢")
default: print(myPet?.rawValue ?? Pet.dog.rawValue)
}

//: [Next](@next)
