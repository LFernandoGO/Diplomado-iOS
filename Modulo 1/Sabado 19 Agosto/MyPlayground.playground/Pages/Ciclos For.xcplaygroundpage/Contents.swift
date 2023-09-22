//: [Previous](@previous)

import Foundation

// FOR

// Manera 1
for i in 1...5{
    print(i)
}
print("-----------")

// Con arreglos
let numbers = [1,3,5,7]
for number in numbers{
    print(number)
}
print("-----------")

// Con intervalos
let intervals = stride(from: 0, to: 20, by: 5)
for interval in intervals{
    print(interval)
}
print("-----------")

// Con el numero de elementos de un arreglo
for num in 0...numbers.count{
    print(num)
}
print("-----------")

// Con diccionarios
let pokemon = ["Fire": "Charmander", "Water": "Mudkip", "Grass": "Turtwig", "Electric": "Pikachu"]

for (type, name) in pokemon {
    print("I like \(name) of type \(type)")
}
print("-----------")
for poke in pokemon {
    print("I like \(poke.value) of type \(poke.key)")
}
print("-----------")

// Con sets
let names = ["James","Dean","Sam","Steve","Chris"]
print("For-in loop with counter as index")
var index = 0
for _ in names {
    print(index)
    index += 1
}
print("-----------")

// Con sets e indices enumerated
print("For-in loop enumerated")
var index2 = 0
for (index2, name) in names.enumerated() {
    print(index2, name)
}
print("-----------")

// Con diccionario y enumerated
print("For-in loop enumerated")
var index3 = 0
for (index3, pokemon) in pokemon.enumerated() {
    print("\(index), \(pokemon)")
}
print("-----------")
for (index3, (type, name)) in
    pokemon.enumerated() {
    print("\(index), \(type) \(name)")
}
print("-----------")

// Se pueden poner condicionales en los ciclos e interrumpirse
for (index, name) in names.enumerated(){
    if index % 2 == 0{
        print(name)
    } else {
        break // Detiene el ciclo si el indice no es par
    }
}
print("-----------")

// Se pueden poner condicionales y utilizar el "Continue"
for (index, name) in names.enumerated(){
    if index % 2 == 0{
        print(name)
        continue // Cada que haya un indice par omite el codigo de abajo
    }
    print(index)
}
print("-----------")

// Con where
for (index,name) in names.enumerated(){
    where index % 2 == 0{
        print(name)
    }
}
print("-----------")

// Con el diccionario y where
for poke in pokemon where poke.key == "Fire"{
    print(poke.value)
}

//: [Next](@next)
