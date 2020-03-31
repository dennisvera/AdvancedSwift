// Copyright (c) 2019 Razeware LLC
// See Copyright Notice page for details about the license.


struct PointValue {
  var x: Int
  var y: Int
}

final class PointReference {
  var x: Int
  var y: Int

  init(x: Int, y: Int) {
    self.x = x
    self.y = y
  }
}

do {
  let p1 = PointValue(x: 10, y: 12)
  var p2 = p1
  p2.x = 100
  dump(p1)
  dump(p2)
}

print("\n----------------\n")

do {
  let p1 = PointReference(x: 10, y: 12)
  let p2 = p1
  p2.x = 100
  dump(p1)
  dump(p2)
}
