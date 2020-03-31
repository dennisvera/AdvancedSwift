// Copyright (c) 2019 Razeware LLC
// See Copyright Notice page for details about the license.

struct Email: Equatable {
  private(set) var address: String

  // Failable intializer to guard against emails without the @ symbol
  init?(_ raw: String) {
    guard raw.contains("@") else {
      return nil
    }
    self.address = raw
  }
}

class User {
  var id: Int?
  var name: String
  var email: Email
  
  init(id: Int?, name: String, email: Email) {
    self.id = id
    self.name = name
    self.email = email
  }

  static func ==(lhs: User, rhs: User) -> Bool {
    return lhs.id == rhs.id &&
      lhs.name == rhs.name &&
      lhs.email == lhs.email
  }
}

guard let email = Email("ray@example.com") else { fatalError("Not a valid email") }

let user1 = User(id: nil, name: "Ray", email: email)
let user2 = User(id: nil, name: "Ray", email: email)


// With the "==" operator you can determine if the have the same value
user1 == user2 // returns true

// With the "===" operator you can determine if the values point to the same reference
user1 === user2 // returns false

let user3 = user1
user3 === user1 // returns true

