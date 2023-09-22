import Foundation

// Stack (LIFO) Push & Pop

// TIPOS GENÉRICOS
struct Stack<Element>: Sequence {
    typealias Iterator = StackIterator // Estos typeAlias pueden ser inferidos
    typealias Element = StackIterator<Element>.Element
    
    var items = [Element]()
    
    mutating func push(_ newItem: Element){
        items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        guard !items.isEmpty else { return nil } // Comprobar si el arreglo esta vacio
        return items.removeLast()
    }
    
    // where permite poner consideraciones conforme a los tipos de datos, es decir, que el elemento que se agregue sea del tipo elemento
    mutating func pushAll<S: Sequence>(_ sequence: S) where S.Element == Element{
        for item in sequence{
            self.push(item)
        }
    }
    
    func makeIterator() -> StackIterator<Element> {
        return StackIterator(stack: self)
    }
    
    func myMap<U>(_ transformer: (Element) -> (U)) -> Stack<U>{
        var result = [U]()
        for item in items {
            let transformedItem = transformer(item)
            result.append(transformedItem)
        }
        
        return Stack<U>(items: result)
    }
}

//var intStack: Stack<Int> = Stack()
//intStack.push(1)
//intStack.push(2)
//print(intStack.pop())
//print(intStack.pop())
//print(intStack.pop())

var doubleStack: Stack<Double> = Stack()
doubleStack.push(2.0)
print(doubleStack.pop())
print(doubleStack.pop())

// FUNCION CON PARÁMETROS GENÉRICOS (myMap)
var intStack = Stack<Int>()
intStack.push(1)
intStack.push(2)

var doubledStack = intStack.myMap{$0 * 2} // Esta es la funcion
print(intStack.pop())
print(intStack.pop())
print(doubledStack.pop())
print(doubledStack.pop())

// Se pueden combinar genericos con protocolos
func checkIfEqual<T: Equatable>(_ first: T, _ second: T) -> Bool {
    return first == second
}
print(checkIfEqual("One", "One"))

// El protocolo es para ver como se esta imprimiendo en consola
func checkIfDescriptionMatch<T: CustomStringConvertible, U: CustomStringConvertible>(_ first: T, _ second: U) -> Bool {
    return first.description == second.description
}
print(checkIfDescriptionMatch(Int(1), UInt8(1)))
print(checkIfDescriptionMatch(Int(1), Double(1.0)))

/* PROTOCOLO con tipo de dato asociado generico. El protocolo no puede ser genérico pero si puede tener un tipo de dato asociado de tipo generico */

//protocol IteratorProtocol {
//    associatedtype Element
//    mutating func next() -> Element?
//}

struct StackIterator<T>: IteratorProtocol {
    typealias Element = T // Element es el tipo de dato asociado de IteratorProtocol
    
    var stack: Stack<T>
    
    mutating func next() -> T? {
        return stack.pop()
    }
}

var myStack = Stack<Int>()
myStack.push(10)
myStack.push(20)
myStack.push(30)

let mySet: Set<Int> = [1,2,3,4]
myStack.pushAll(mySet)

for value in myStack {
    print("for in loop: got \(value)")
}

// Se pasa una copia (Paso por valor) del Stack
//var myStackIterator = StackIterator(stack: myStack)
//while let value = myStackIterator.next() {
//    print(value)
//}

// PROTOCOLO DE SECUENCIA: tiene dos tipos de dato asociados y un metodo
//protocol Sequence {
//    associatedtype Iterator: IteratorProtocol
//    associatedtype Element where Element == Iterator.Element
//
//    func makeIterator() -> Iterator
//}


