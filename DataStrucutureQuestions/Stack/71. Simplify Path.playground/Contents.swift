import UIKit

// - Complexity:
//   - time: O(n), where n is the length of path.
//   - space: O(n), where n is the length of path.
func simplifyPath(_ path: String) -> String {
    let paths = path.split(separator: "/")
    var stack = [String]()
    for path in paths {
        guard path != ".", !path.isEmpty else { continue }
        
        if path == ".." {
            if !stack.isEmpty {
                stack.removeLast()
            }
        } else {
            stack.append(String(path))
        }
    }
    return "/\(stack.joined(separator: "/"))"
}

let path  = "/home/"
let path2 = "/../"
print(simplifyPath(path))
print(simplifyPath(path2))
print(simplifyPath("/home//foo/"))

