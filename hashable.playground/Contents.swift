// Copyright (c) 2019 Razeware LLC
// See Copyright Notice page for details about the license.

struct Email: Hashable {
  init?(_ raw: String) {
    guard raw.contains("@") else {
      return nil
    }
    address = raw
  }
  
  private(set) var address: String
}

class User: Hashable {
  var id: Int?
  var name: String
  var email: Email
  
  init(id: Int?, name: String, email: Email) {
    self.id = id
    self.name = name
    self.email = email
  }

  // Equatable protocol helper method
  static func ==(lhs: User, rhs: User) -> Bool {
    return lhs.id == rhs.id &&
      lhs.name == rhs.name &&
      lhs.email == rhs.email
  }

  // Helper method conforming to the Hashable protocol
  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
    hasher.combine(name)
    hasher.combine(email)
  }
}

