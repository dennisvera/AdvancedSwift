// Copyright (c) 2019 Razeware LLC
// See Copyright Notice page for details about the license.

//: -  Improve `lookup` with `Phantom Types` -- the name is not very descriptive
var lookup: [String: String] = ["Alabama": "Montgomery",
                                "Alaska":  "Juneau",
                                "Arizona": "Phoenix"]

//: -` Solution`
struct Named<T>: Hashable, ExpressibleByStringLiteral, CustomStringConvertible {
  var name: String

  init(_ name: String) {
    self.name = name
  }

  init(stringLiteral value: String) {
    name = value
  }

  var description: String {
    return name
  }
}

enum StateTag {}
enum CapitalTag {}

typealias State = Named<StateTag>
typealias Capital = Named<CapitalTag>

var lookup2: [State: Capital] = ["Alabama": "Montgomery",
                                 "Alaska":  "Juneau",
                                 "Arizona": "Phoenix"]

// Helper method to test the lookup2 variable
func printStateAndCapital(_ state: State, _ capital: Capital) {
  print("The capital of \(state) is \(capital)")
}

func test() {
  let alaska = State("Alaska")
  guard let capital = lookup2[alaska] else { return }
  printStateAndCapital(alaska, capital)
}

test()
