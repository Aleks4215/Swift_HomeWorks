import UIKit

enum Season {
    case winter
    case spring
    case summer
    case autumn
    case error
    
    func season(month: Int) -> Season {
        switch month {
        case 1,2,12:
            return.winter
        case 3...5:
            return.spring
        case 6...8:
            return.summer
        case 9...11:
            return.autumn
        default:
            return.error
        }
    }
}


func variadicString(_ strings: String?...) -> Int {
    var counter = 0
    var stringNotNil = ""
    
    for string in strings {
        if let notNilString = string {
            stringNotNil = stringNotNil + notNilString
        } else {
            counter+=1
        }
    }
    print(stringNotNil)
    return counter
}
