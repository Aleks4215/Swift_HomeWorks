import UIKit

//Создайте два массива. Первый от 0 до 14, второй от 14 до 30. Объедините их в один массив.

var arr: [Int] = [0, 1,2,3,4,5,6,7,8,9,10,11,12,13,14]
var arr2: [Int] = [14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]


for number in arr2 {
    arr.append(number)
}

//Создать функцию, которая принимает массив int. Возвести все Int в квадрат. Возвратить новый массив.

func squrArr(arr: [Int]) -> [Int] {
    
    return arr.map { $0 * $0 }
}

squrArr(arr: arr2)


//Создать функцию, которая принимает массив int. Возвратить новый массив с только четными элементами.

func checkEvenNumber(arr: [Int]) -> [Int] {
    
    var sortedArray = arr.filter {
        $0 % 2  == 0
    }
    return sortedArray
}

//Написать 3 примера с использованием .map

var arrNames: [String] = ["Bob","Helga", "Alex"]
let loweCaseNames = arrNames.map {$0.lowercased() }
print(loweCaseNames)
let capitalizedNames = arrNames.map {$0.capitalized }
print(capitalizedNames)
let countOfChars = arrNames.map { $0.count }
print(countOfChars)





//Написать 2 примера с использованием .filter

var numbersArr : [Int] = [1, 0, 3, 4, 6, 8]
let arrWithoutZero = numbersArr.filter {$0 != 0}
print(arrWithoutZero)

let evenNumbers = numbersArr.filter {$0 % 2 == 0}
print(evenNumbers)

//Написать 2 примера с использованием .compactMap

var arrayNilInt: [String?] = [nil, "2", "3", "4", "8", "5"]
var newArrWithouNil = arrayNilInt.compactMap { str in
    Int(str ?? "")
}

print(newArrWithouNil)

var newArr: [String?] = [nil, "2", "3", "4", "8", nil, "c", "$", "^"]
var newArrInt = newArr.compactMap { str in
    Int(str ?? "")
}
print(newArrInt)


//Написать 2 примера с .sort

var unsortedArray = ["1", "6", "2", "4", "3", "5"]
var unsortedArrayInt = [1, 4, 7, 9, 10, 8, 6, 5]

unsortedArray.sort()
unsortedArray.sort(by: >)

unsortedArrayInt.sort()
//Написать 2 примера с .sorted
unsortedArray.sorted()
unsortedArray.sorted(by: <)
unsortedArrayInt.sorted(by: >)

