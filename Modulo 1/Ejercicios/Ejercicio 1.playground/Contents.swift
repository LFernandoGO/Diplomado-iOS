import UIKit

// PROPUESTA PROPIA
var time = 25
var weather: String

if time >= 0 && time <= 6{
    weather = "No necesitas bloqueador"
    print(weather)
} else if time >= 7 && time <= 18 {
    weather = "Usa bloqueador"
    print(weather)
} else if time >= 19 && time <= 23 {
    weather = "No necesitas bloqueador"
    print(weather)
}

// CON ARREGLOS Y OPERADOR CLOSE RANGE
var weather2 = "lluvia"
var time2 = 13
var dark = Array(0...6) + Array(19...23)
var light = 7...18 // CLOSE RANGE DE ENTEROS

if weather2 == "lluvia"{
    print("⛈")
} else if weather2 == "nieve"{
    print("❅")
}
if light ~= time2 {
    print("Usa bloqueador")
} else {
    print("No necesitas bloqueador")
}
