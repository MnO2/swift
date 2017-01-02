// RUN: %target-swift-frontend -typecheck -verify %s
class HTMLElement {
  let name: String
  var asHTML: () -> String

  init(name: String) {
    self.name = name
    self.asHTML = { //expected-warning {{block will be retained by an object strongly retained by the captured}}
      return "<\(self.name)>" //expected-warning {{capturing 'self' strongly in this block is likely to lead to a retain cycle}}
    }
  }
}
