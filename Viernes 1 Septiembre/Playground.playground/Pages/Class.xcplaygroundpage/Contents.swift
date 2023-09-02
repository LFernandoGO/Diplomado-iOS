//: [Previous](@previous)

import Foundation

class Vehicle{
    var brand: String
    let model: String
    var owner: String?
    let serialNumber: String
    var wheels: Int?
    
    // Solo GET -> VARIABLE COMPUTADA
    var type: String{
        return(wheels ?? 0) > 0 ? "land": "other"
    }
    
    // GET y SET -> VARIABLE COMPUTADA
    var registration: (name: String, serialNumber: String, type: String)? {
        get {
            if let owner = owner{ // Valida si hay un propietario (existe)
                return(owner, serialNumber, type)
            }
            return nil
        }
        set(newRegistrarion) {
            // Se tiene que asegurar que hay un registro
            if let newRegistrarion = newRegistrarion {
                owner = newRegistrarion.name
            }
        }
    }
    
    // Inicializador designado
    init(brand: String, model: String, serialNumber: String, wheels: Int?){
        self.brand = brand
        self.model = model
        self.serialNumber = serialNumber
        self.wheels = wheels
    }
    
    // Metodos de instancia (Se necesita la instancia)
    // private var isMoving: Bool = false -> No se puede acceder por la instancia
    var isMoving: Bool = false
    func move(){
        isMoving = true
    }
    func stop(){
        isMoving = false
    }
    
    // Metodo de clase (No se necesita la instancia)
    static func describe(){
        print("a vehicle!")
    }
    
    func makeNoise() -> String {"Noise"}
}

var myVehicle = Vehicle(brand: "VW", model: "2020", serialNumber: "1234", wheels: 4)
myVehicle.registration = (name: "Luis", serialNumber: "87654321", type: "Other")
myVehicle.move()
myVehicle.isMoving
myVehicle.stop()
myVehicle.isMoving
Vehicle.describe()

class Car: Vehicle {
    override var brand: String{
        willSet(newName){ // Se llama previo a que se haga el cambio de valor
            print("My new name is \(newName)")
        }
        didSet { //Se tiene acceso al valor anterior (cuando ya se hizo cambio)
            print("My old name was \(oldValue)")
        }
    }
    override var type: String{
        return "Car"
    }
    
    var isElectric: Bool
    
    // Orden de inicializacion
    init(electric: Bool){
        // Primero se inicializa la clase actual
        self.isElectric = electric
        // Despues se inicializa la clase super (O de la que se hereda)
        super.init(brand: "Toyota", model: "Prius", serialNumber: "1111", wheels: 4)
    }
    
    // Sobre escritura de metodo
    override func makeNoise() -> String {"BRUUUUUMM"}
    
    // Sobre escritura de inicializador
    override init(brand: String, model: String, serialNumber: String, wheels: Int?) {
        isElectric = brand == "Toyota"
        super.init(brand: brand, model: model, serialNumber: serialNumber, wheels: wheels)
    }
    
    init(brand: String, model: String, serialNumber: String, isElectric: Bool){
        self.isElectric = isElectric
        super.init(brand: brand, model: model, serialNumber: serialNumber, wheels: 4)
    }
    
    // Inicializadores de CONVENIENCIA
    convenience init(suzukiModel model: String, serialNumber: String, isElectric: Bool, boughtBy name: String) {
        self.init(brand: "Suzuki", model: model, serialNumber: serialNumber, isElectric: isElectric)
        owner = name
    }
}

let myCar = Car(electric: true)
myCar.isElectric
myCar.brand
myCar.makeNoise()

let yourCar = Car(brand: "Suzuki", model: "Swift", serialNumber: "23452", isElectric: false)
yourCar.brand = "Volvo"

//: [Next](@next)
