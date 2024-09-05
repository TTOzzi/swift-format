import SwiftFormat

final class AllowWhitespaceOnlyLinesTests: PrettyPrintTestCase {
  func testAllowWhitespaceOnlyLinesEnabled() {
    let input =
      """
      class A {
        func foo() -> Int {
          return 1
        }
        
        func bar() -> Int {
          return 2
        }
      }
      """

    let expected =
      """
      class A {
        func foo() -> Int {
          return 1
        }
        
        func bar() -> Int {
          return 2
        }
      }
      
      """
    var config = Configuration.forTesting
    config.allowWhitespaceOnlyLines = true
    assertPrettyPrintEqual(input: input, expected: expected, linelength: 80, configuration: config)
  }
  
  func testAllowWhitespaceOnlyLinesDisabled() {
    let input =
      """
      class A {
        func foo() -> Int {
          return 1
        }
        
        func bar() -> Int {
          return 2
        }
      }
      """

    let expected =
      """
      class A {
        func foo() -> Int {
          return 1
        }
      
        func bar() -> Int {
          return 2
        }
      }
      
      """
    var config = Configuration.forTesting
    config.allowWhitespaceOnlyLines = false
    assertPrettyPrintEqual(input: input, expected: expected, linelength: 80, configuration: config)
  }
  
  func testExpressionsWithUnnecessaryWhitespaces() {
    let input =
      """
          class A {
        func   foo() -> Int {
          return 1
        }
        
        func bar()    -> Int {
          return 2
        }
      }
      """

    let expected =
      """
      class A {
        func foo() -> Int {
          return 1
        }
        
        func bar() -> Int {
          return 2
        }
      }
      
      """
    var config = Configuration.forTesting
    config.allowWhitespaceOnlyLines = true
    assertPrettyPrintEqual(input: input, expected: expected, linelength: 80, configuration: config)
  }
}
