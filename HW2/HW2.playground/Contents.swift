import UIKit

// Register errors
enum RegisterError: Error {
    case invalidName
}
enum LogInError: Error {
    case bannedUser
    case notExistingUser
}

// User status
enum UserStatus {
    case admin
    case regular
    case ban
}

// Current status of user
enum CurrentUserStatus {
    case online
    case offline
}

// User model
class User {
    var betsys: BettingSystem
    var status: UserStatus
    var name: String
    var password: String
    var connection: CurrentUserStatus = .offline
    var bets: Array <String> = []
    
    
    init(status: UserStatus, name: String, password: String, bettingSystem: BettingSystem) {
        self.status = status
        self.name = name
        self.password = password
        self.betsys = bettingSystem
    }
    
    func changeStatus(newStatus: UserStatus) {
        status = newStatus
    }
    
    
    // Process of changing current status of user
    func changeCurrentStatus() {
        if connection == .offline {
            connection = .online
        } else {
            connection = .offline
        }
    }
    
    // User can print all own bets
    func printBets() {
        for bet in bets {
            print(bet)
        }
    }
    
    // Admin user can print all regular users bets
    func checkUsers() {
        guard connection == .online else { return }
        guard status == .admin else { return }
        betsys.checkUsers()
    }
    
    // Admin user can make a ban of regular user
    func makeBan(name: String) {
        guard connection == .online else { return }
        guard status == .admin else { return }
        
        betsys.makeBan(name: name)
    }
    
}

//Main code of betting system
class BettingSystem {
    
    var users = [String: User]()
    
    
    // Registration of new user
    func register(role: UserStatus, name: String, password: String) throws {
        guard users[name] == nil else {
            throw RegisterError.invalidName
        }
        users[name] = User.init(status: role, name: name, password: password, bettingSystem: self)
        users[name]?.changeCurrentStatus()
    }
    
    func logIn(name: String, password: String) throws {
        guard users[name] != nil else {
            throw LogInError.notExistingUser
        }
        guard users[name]?.status != .ban else {
            throw LogInError.bannedUser
        }
        
        if users[name]?.password == password {
            guard (users[name]?.connection = .offline) != nil else { return }
            users[name]?.changeCurrentStatus()
        }
    }
    
    func logOut(user: User) {
        guard user.connection == .online else { return }
        user.changeCurrentStatus()
    }
    
    func makeBet(user: User, bet: String) {
        guard user.status == .regular else { return }
        guard user.connection == .online else { return }
        print("\(user.name) bet \(bet)")
        user.bets.append(bet)
    }
    
    func checkUsers() {
        
        for (name, user) in users {
            print("\(name)s bets:")
            user.printBets()
        }
    }
    
    func makeBan(name: String) {
        guard users[name]?.status == .regular else { return }
        
        users[name]?.status = .ban
        users[name]?.connection = .offline
    }
    
    
    
}








// TESTING

//var pariMatch = BettingSystem()
//do {
//    try pariMatch.register(role: .regular, name: "Volodymyr", password: "blahoi")
//} catch RegisterError.invalidName {
//    print("This name is already exist")
//}
//
//do {
//    try pariMatch.register(role: .regular, name: "Ivan", password: "parol")
//} catch RegisterError.invalidName {
//    print("This name is already exist")
//}
//
//pariMatch.users["Volodymyr"]?.connection
//pariMatch.logOut(user: pariMatch.users["Volodymyr"]!)
//
//do {
//    try pariMatch.logIn(name: "Volodymyr", password: "blahoi")
//} catch LogInError.bannedUser {
//    print("Sorry, you are banned")
//}
//
//
//
//pariMatch.makeBet(user: pariMatch.users["Volodymyr"]!, bet: "Dynamo win")
//pariMatch.makeBet(user: pariMatch.users["Volodymyr"]!, bet: "Liverpool lose")
//pariMatch.makeBet(user: pariMatch.users["Ivan"]!, bet: "Barselona win")
//pariMatch.users["Volodymyr"]!.printBets()
//pariMatch.users["Ivan"]!.printBets()
//
//do {
//    try pariMatch.register(role: .admin, name: "Administrator", password: "password")
//} catch RegisterError.invalidName {
//    print("This name is already exist")
//}
//
//pariMatch.users["Administrator"]!.checkUsers()
//pariMatch.users["Administrator"]!.makeBan(name: "Ivan")
//
//do {
//    try pariMatch.logIn(name: "Ivan", password: "parol")
//} catch LogInError.bannedUser {
//    print("Sorry, you are banned")
//}
//
//
//pariMatch.users

