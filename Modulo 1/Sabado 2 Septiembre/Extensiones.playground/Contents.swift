import Foundation

// Extensions
/*
Pueden conformar protocolos para tener el codigo mas ordenado
Pueden agregar funcionalidades a tipos ya definidos, por ejemplo Double
Puede crear inicializadores propios sin perder el acceso al inicializador original
Se pueden crear tipos anidados
Las extensiones pueden ver todas las propiedades del tipo aunque sean privadas
 */

extension Double {
    var squared: Double { return self * self }
}

let sideLenght: Double = 12.5
let area = sideLenght.squared

print(area)

struct Car {
    let maker: String
    let model: String
    let year: Int
    
    var fuelLevel: Double {
        willSet {
            precondition(newValue <= 1.0 && newValue >= 0.0, "New value must be between 0 and 1")
        }
    }
}

extension Car: CustomStringConvertible {
    var description: String {
        "\(maker) - \(model)"
    }
}

// Inicializadores
extension Car {
    init(maker: String, model: String){
        self.init(maker: maker, model: model, year: 2018, fuelLevel: 1.0)
    }
}

// Nested type (Anidados)
extension Car {
    enum Era {
        case vintage, classic, modern
    }
    
    var era: Era {
        switch year {
        case ...1990:
            return .vintage
        case 1991...2000:
            return .classic
        case 2001...:
            return .modern
        default:
            return .modern
        }
    }
}

// Add method (Agregar metodos)
extension Car {
    mutating func fillFuel(){
        fuelLevel = 1.0
    }
}


var firstCar = Car(maker: "Honda", model: "Civic", year: 2018, fuelLevel: 0.3)
var secondCar = Car(maker: "Volkswagen", model: "GTI")

print(firstCar)
print(firstCar.fuelLevel)
firstCar.fillFuel()
print(firstCar.fuelLevel)
print(secondCar)
