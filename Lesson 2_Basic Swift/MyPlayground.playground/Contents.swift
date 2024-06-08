import Foundation

let str: String = "String"
var strVar: String = "String"

let boolLet: Bool = true
var boolVar: Bool = false

let intLet: Int = 15
var intVar: Int = 7
intVar = Int(Int8.max)
print(intVar)
intVar = Int(Int16.max)
print(intVar)
intVar = Int(UInt8.max)
print(intVar)

let fltLet: Float = 1.0
var fltVar: Float = 2.0


let dblLet: Double = 3.0
var dblVar: Double = 4.0

fltVar = Float(dblLet)
strVar = String(boolLet)
print(strVar)
strVar = String(boolVar)
print(strVar)
print("\(intLet) + \(intVar) = \(intLet + intVar)")
print("\(Double(intLet)) - \(dblVar) = \(Double(intLet) - dblVar) ")
print("\(intLet) * \(intVar) = \(intLet * intVar)")
print("\(dblVar) / \(Double(fltVar)) = \(dblVar / Double(fltVar))")


func isNight() -> Bool {
    let currentHour = Calendar.current.component(.hour, from: Date.now)
    if currentHour >= 11 {
        return true
    } else {
        return false
    }
}


var newString: String = ""

for char in str {
    newString += String(char)
    print(newString)
}

let arr: [Int] = [13, 2, 20, 21, 76]

for number in arr {
    if number % 2 == 0 {
        print("\(number) четное число")
    } else {
        print("\(number) нечетное число")
    }
    print("конец массива")
}


func checkDecade(day: Int) {
    switch(day) {
    case 1...10:
        print("Первая декада")
    case 11...20:
        print("Втоорая декада")
    case 21...31:
        print("Третья декада")
    default:
        print("Проверьте правильность вводимых данных")
    }
}


checkDecade(day: 11)


let strNew = "abbppeeyy"

if strNew.first == "a" {
    print("да")
} else {
    print("нет")
}

for i in 1...10 {
    for j in 1...10 {
        let result = i * j
        print("\(i) * \(j) = \(result)")
    }
}
