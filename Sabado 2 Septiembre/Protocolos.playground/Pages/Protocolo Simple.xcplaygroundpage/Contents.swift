//: [Previous](@previous)

import Foundation

protocol Student: CustomStringConvertible {
    var accountNumber: Int { get }
    var name: String {get }
}

struct EngineeringStudent: Student {
    var description: String {
        "Engineering Student - \(name)"
    }
    
    var accountNumber: Int
    var name: String
    
    var hasCalculator: Bool
}

struct MedicineStudent: Student {
    var description: String {
        "Medicine Student - \(name)"
    }
    
    var accountNumber: Int
    var name: String
    
    let hasLabCoat: Bool
}

let engineeringStudent = EngineeringStudent(accountNumber: 313204186, name: "Alejandro", hasCalculator: false)
let medicineStudent = MedicineStudent(accountNumber: 314325463, name: "Mariana", hasLabCoat: true)

func printStudentsInformation(_ student: Student){
    print("\(student.name) - \(student.accountNumber)")
    
    if let medicineStudent = student as? MedicineStudent{
        if medicineStudent.hasLabCoat == true{
            print("\(student.name) has a Lab Coat")
        } else {
            print("\(student.name) has not a Lab Coat")
        }
        //print(medicineStudent.hasLabCoat)
    }
}

printStudentsInformation(engineeringStudent)
printStudentsInformation(medicineStudent)

print(engineeringStudent)
print(medicineStudent)


//: [Next](@next)
