//: [Previous](@previous)

import XCTest // Framework de pruebas

// Para poder hacer pruebas tiene que existir una subclase de XCTestCase
class MyTests: XCTestCase {
    
    func getFullName(_ nameTuple: (String, String?, String, String?)) -> String{
        if (nameTuple.1 == nil) && (nameTuple.3 == nil){
            return nameTuple.0 + " " + nameTuple.2
        } else{
            return nameTuple.0 + " " + (nameTuple.1 ?? "") + " " + nameTuple.2 + " " + (nameTuple.3 ?? "")
        }
    }
    
    // Para pruebas las funciones deben tener el prefijo "test" y no mandar ni regresar ningun dato. Las pruebas se dividen en 3 fases.
    func test_GetFullName(){
        // given (que es lo que tenemos - preambulo)
        let firstPerson: (String, String?, String, String?) = (first: "Luis", second: "Fernando", firstLastName: "Gutierrez", secondLastName: "Orozpe")
        let secondPerson: (String, String?, String, String?) = (first: "Manuel", second: nil, firstLastName: "Perez", secondLastName: nil)
        let thirdPerson: (String, String?, String, String?) = (first: "Dante", second: "", firstLastName: "Sanchez", secondLastName: nil)
        
        // when (el proceso por el que pasan los datos - qué pasó)
        let firstFullName = getFullName(firstPerson)
        let secondFullName = getFullName(secondPerson)
        let thirdFullName = getFullName(thirdPerson)
        
        // then
        XCTAssertEqual(firstFullName, "Luis Fernando Gutierrez Orozpe")
        XCTAssertEqual(secondFullName, "Manuel Perez")
        //XCTAssertEqual(thirdFullName, "Dante Sanchez")
    }
}

MyTests.defaultTestSuite.run()

//: [Next](@next)
