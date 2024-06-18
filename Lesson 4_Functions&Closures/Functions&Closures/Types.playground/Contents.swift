import UIKit

////задание 1 Написать функцию, которая:
//- Будет просто выводить в консоль ”Hello, world!”.
//- Будет принимать аргумент “имя” и выводить в консоль “Hello, имя” (вызов функции
//должен быть следующим - printHi(“Misha”)).
//- Будет принимать аргумент имя и возвращать строку приветствия “Hello! имя”.

func helloWorld() {
    print("Hello, world!")
}

func printHi(_ name: String) {
    print("Hello, \(name)")
}

func printHello(name: String) -> String {
    return "Hello! \(name)"
}


//2. Написать функцию, которая принимает две строки и возвращает сумму количества
//символов двух строк.


func sumChars(a: String, b: String) -> Int {
    let sum = a + b
    return sum.count
}

sumChars(a: "abc", b: "Abc")


//3. Написать функцию, которая выводит в консоль квадрат переданного числа.

func sqr(number: Int) {
    print("\(number * number)")
}

//4. Создать функции, которые будут суммировать, вычитать, умножать и делить числа
//sum(num1:num2:).



func result(a: Int, b: Int, logic: (Int, Int) -> Int) -> Int {
    return logic(a, b)
}

func minus(a: Int, b: Int) -> Int {
    return a - b
}

func plus(a: Int, b: Int) -> Int {
    return a + b
}

func divide(a: Int, b: Int) -> Int {
    return Int(a / b)
}

func multiply(a: Int, b: Int) -> Int {
    return a * b
}


result(a: 1, b: 2, logic: plus(a:b:))


//5. Создать функцию, которая принимает параметры и вычисляет площадь круга.


func squareTriangle(r: Double) -> Double {
    let result = Double.pi * (r * r)
    return result
}


//6. Создать функцию, которая принимает логический тип “ночь ли сегодня” и возвращает
//строку с описанием времени суток.


func isNight(isNight: Bool) -> String {
    if isNight {
        return "Сейчас ночь"
    }
    return "Сейчас день"
}



//7. Создать функцию, принимающую 1 аргумент — число от 0 до 100, и возвращающую
//true, если оно простое, и false, если сложное.

func isSimpleNumber(n: Int) -> Bool {
    if (n > 1 && n % n == 0 && n % 2 != 0) {
        return true
    }
    return false
}

isSimpleNumber(n: 655360001)


//8. Создать функцию, принимающую 1 аргумент — номер месяца (от 1 до 12), и
//возвращающую время года, которому этот месяц принадлежит (зима, весна, лето или
//осень).

func timeOfYear(month: Int) -> String {
    switch(month) {
    case 1...2, 12:
        return "Зима"
    case 3...5:
        return "Весна"
    case 6...8:
        return "Лето"
    case 9...11:
        return "Осень"
    default:
        return "Проверьте вводимые данные"
    }
}


//9*. Создать функцию, которая считает факториал введённого числа.

func factorial(n: Float) -> Float {
    if(n == 0 || n == 1.0) {
        return 1.0
    }
    return factorial(n: n - 1) * n
}


factorial(n: 10)



//10*. Создать функцию, которая выводит все числа последовательности Фибоначчи до
//введённого индекса. Например fib(n:6) -> 0, 1, 1, 2, 3, 5, 8


func fib(n: Int) -> [Int] {
    var arr: [Int] = [0, 1]
    if n < 0 {
        return []
    } else if n == 0 {
        return [0]
    } else if n == 1 {
        return [0, 1]
    }
    
    for i in 2...n {
        arr.append(arr[i - 1] + arr[i - 2])
    }
    
    return arr
}

func fibRec(_ n: Int) -> Int {
       if n <= 1 {
           return n
       }
       return fibRec(n - 1) + fibRec(n - 2)
   }
   
   var arr: [Int] = []
   for i in 0...n {
       arr.append(fibRec(i))
   }
   
   return arr
}

fib(n: 6)


//11*. Создать функцию, которая считает сумму цифр четырехзначного числа,
//переданного в параметры функции


func summ(number: Int) -> Int {
    let stringNumber = String(number)
    var arr: [Int] = []
    var sum = 0
    if(stringNumber.count == 4) {
        for char in stringNumber {
            arr.append(Int(String(char)) ?? 0)
        }
    }
    for index in arr {
        sum += index
    }
    return sum
}

summ(number: 1234)




