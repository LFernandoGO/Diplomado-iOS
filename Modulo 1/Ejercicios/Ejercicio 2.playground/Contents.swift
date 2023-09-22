import UIKit

let x = 1
let y = 2
var coordenada = (x,y)

switch coordenada{
case (0,0):
    print("Esta en el origen")
case(0,0...),(0,...0):
    print("Esta en el eje y, el valor de y es \(y)")
case(0...,0),(...0,0):
    print("Esta en el eje x, el valor de x es \(x)")
case(0...,0...):
    print("Esta en el cuadrante 1, x es: \(x), y es: \(y)")
case(...0,0...):
    print("Esta en el cuadrante 2, x es: \(x), y es: \(y)")
case(...0,...0):
    print("Esta en el cuadrante 3, x es: \(x), y es: \(y)")
case(0...,...0):
    print("Esta en el cuadrante 4, x es: \(x), y es: \(y)")
default: print("meh")
}
