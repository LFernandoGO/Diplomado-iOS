//: [Previous](@previous)

import Foundation

// Puede iterar hasta que una condición lo detenga
var counter = 1
while counter < 10 {
    print(counter)
    counter += 1
}
print("-----------")

// REPEAT WHILE (Primero ejecuta, luego valida)
counter = 1
repeat {
    print(counter)
    counter += 1
} while counter < 10

//: [Next](@next)
