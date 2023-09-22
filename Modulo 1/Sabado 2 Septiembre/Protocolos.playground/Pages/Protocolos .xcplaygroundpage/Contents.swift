import Foundation

// --------------------------------- PROTOCOLOS ----------------------------------------------
/*
Permiten generar abstracciones en el codigo. Permiten encapsular caracteristicas del codigo que se puedan utilizar posteriormente.
Permiten definir una lista de propiedades y metodos que se quiera que un tipo contenga, si el tipo requiere de esos elementos quiere decir que el tipo conforma al protocolo.
 */

protocol TabularDatSource: CustomStringConvertible {
    var numberOfRows: Int {get} // El get significa que la propiedad debe ser publica (leerse)
    var numberOfColumns: Int {get}
    
    func label(forColumn column: Int) -> String
    func itemFor(row: Int, column: Int) -> String
}

func printTable(_ dataSource: TabularDatSource) {
    var headerRow = "|"
    var columWidths = [Int]()
    
    for index in 0..<dataSource.numberOfColumns {
        let columnLabel = dataSource.label(forColumn: index)
        let columHeader = "\(columnLabel) |"
        headerRow += columHeader
        columWidths.append(columnLabel.count)
    }
    
    print(headerRow)
    
    //for row in data {
    for index in 0..<dataSource.numberOfRows {
        // Start output string
        var output = "|"
        
        //for (index, item) in row.enumerated(){
        for columnIndex in 0..<dataSource.numberOfColumns {
            let item = dataSource.itemFor(row: index, column: columnIndex)
            let paddingNeeded = columWidths[columnIndex] - item.count
            let padding = repeatElement(" ", count: paddingNeeded).joined(separator: "")
            output += "\(padding)\(item) |"
        }
    
        print(output)
    }
}

struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
}

struct Deparment: TabularDatSource {
    let name: String
    var people = [Person]()
    
    var description: String {
        return "Deparment: \(name)"
    }
    
    init(name: String){
        self.name = name
    }
    
    mutating func add(_ person: Person){
        people.append(person)
    }
    
    var numberOfRows: Int { people.count }
    var numberOfColumns: Int { 3 }
    
    func label(forColumn column: Int) -> String {
        let columnHeader: String
        switch column {
        case 0:
            columnHeader = "Employee name"
        case 1:
            columnHeader = "Age"
        case 2:
            columnHeader = "Years Of Experience"
        default: fatalError("Invalid column header index!")
        }
        return columnHeader
    }
    
    func itemFor(row: Int, column: Int) -> String {
        let person = people[row]
        
        switch column {
        case 0: return person.name
        case 1: return String(person.age)
        case 2: return String(person.yearsOfExperience)
        default: fatalError("Invalid column for person!")
        }
    }
}

var deparment = Deparment(name: "Engeneering")
deparment.add(Person(name: "Eva", age: 30, yearsOfExperience: 6))
deparment.add(Person(name: "Saleh", age: 40, yearsOfExperience: 18))
deparment.add(Person(name: "Amit", age: 50, yearsOfExperience: 20))

printTable(deparment)

print(deparment)

// LOS PROTOCOLOS SON TIPOS EN SWIFT

// Polimorfismo
let operationsDataSource: TabularDatSource = Deparment(name: "Other deparment")

// Cast
let engineeringDataSource = deparment as TabularDatSource // La constante es de tipo Tabular

// Preguntar si un tipo conforma a un protocolo
let testPerson = Person(name: "Alejandro", age: 27, yearsOfExperience: 5)
testPerson is TabularDatSource
