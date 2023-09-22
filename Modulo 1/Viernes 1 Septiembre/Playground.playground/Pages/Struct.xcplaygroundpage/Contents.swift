//: [Previous](@previous)

import Foundation

struct Dog {
    var isAdopted: Bool = true// Propiedades almacenadas
    var color: String
    
    var name: String{ // Esto es un OBSERVADOR
        willSet(newName){ // Se llama previo a que se haga el cambio de valor
            print("My new name is \(newName)")
        }
        didSet { //Se tiene acceso al valor anterior (cuando ya se hizo cambio)
            print("My old name was \(oldValue)")
        }
    }
    
    static let amountOfPaws = 4 // Propiedades que no necesitan una instancia
    var paws: Int = 4
    var specialNeeds: Bool{
        paws != Dog.amountOfPaws
    }
    
    func getID() -> String {
        return name + "\n" + "color: \(color)" + "\n" + "paws: \(paws)"
    }
    
    mutating func changeName(newName: String){
        name = newName
    }
    
    static func describeADog() -> String {
        "Dogs are really cute animals!"
    }
    
    /* Si se declara un inicializador propio se pierde el que brinda la estructura
       por defecto */
    init(name: String, isAdopted: Bool, color: String){
        self.name = name
        self.isAdopted = isAdopted
        self.color = color
    }
    
    /* Se puede crear un inicializador independiente del primero, este dice que el perro es adoptado */
    init(adopted name: String, color: String){
        self.name = name
        self.isAdopted = true
        self.color = color
    }
    
    /* Se puede hacer un inicializador que dependa de otro inicializador */
    init(bought name: String, color: String){
        self.init(name: name, isAdopted: false, color: color)
    }
    
    // Otro ejemplo de inicializador personalizado
    init(){
        self.init(adopted: "Milaneso", color: "Brown")
    }
}

var myDog = Dog(name: "Milaneso", isAdopted: true, color: "Brown")
myDog.isAdopted = false
myDog.name = "Dante" // Aqui si entra en la variable OBSERVADOR para cambiar valor
myDog.specialNeeds // En este instante no es falso porque tiene 4 patas
myDog.paws = 3
myDog.specialNeeds // En este instante es verdadero porque tiene 3 patas
myDog.getID()
myDog.changeName(newName: "Chilaquil")
Dog.amountOfPaws
Dog.describeADog()

var yourDog = Dog(adopted: "Chilaquil", color: "White")
var anotherDog = Dog()



//: [Next](@next)
