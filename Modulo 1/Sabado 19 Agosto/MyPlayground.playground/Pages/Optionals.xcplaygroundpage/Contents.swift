//: [Previous](@previous)

import Foundation

// Puede envolver el dato que se esta enviando y puede no contener nada
var cellphone: String = "5587296785"
var landline: String? = "00"

// 1. Dandole un valor por defecto
print(cellphone)
print(landline ?? "No hay nada") // Validar si la variable contiene algo, si tiene, lo desenvuelve, sino, le damos un valor por defecto

// 2. Con operador ternario
var strLandLine = landline != nil ? landline! : "No hay nada" // Se forza la desenvoltura del valor y si no hay nada le pone un valor

// 3. Con force unwrap
// print(landline!) // Si no hay nada, la aplicacion se muere

// SI ES NECESARIO QUE ESTE

// 4. Con if let: Solo ejecuta el codigo si hay un valor en la variable
if let landline = landline {
    print(landline)
}

// 5. Con Guard let: Valida que existe, si existe la pone en una variable de tipo string normal. Si no existe, puede manejar un error
guard let landline = landline else {
    fatalError("oops")}

//: [Next](@next)
