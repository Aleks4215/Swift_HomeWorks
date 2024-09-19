import UIKit

class BankAccount {
    private var balance: Double
    private let lock = NSLock()
    
    init(balance: Double) {
        self.balance = balance
    }
    
    func deposit(amount: Double) {
        lock.lock()
        balance += amount
        print("Баланс пополнен, текущий баланс \(balance)")
        lock.unlock()
    }
    
    func withDraw(amount: Double) {
        lock.lock()
        if amount <= balance {
            balance -= amount
            print("Снятие средств с баланса произошло успешно, текущий баланс \(balance)")
        } else {
            print("Недостаточно средств")
        }
        lock.unlock()
    }
    
    func getBalance() -> Double {
        return balance
    }
}

let account = BankAccount(balance: 1000)
let queue = DispatchQueue.global(qos: .userInitiated)
let group = DispatchGroup()

for _ in 0..<10 {
    group.enter()
    queue.async {
        account.deposit(amount: 100)
        group.leave()
    }
}

for _ in 0..<5 {
    group.enter()
    queue.async {
        account.withDraw(amount: 100)
        group.leave()
    }
}

group.notify(queue: DispatchQueue.main) {
    print("Финальный баланс \(account.getBalance())")
}

