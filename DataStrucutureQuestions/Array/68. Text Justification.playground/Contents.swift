import UIKit

//https://leetcode.com/problems/text-justification/description/?envType=study-plan-v2&envId=top-interview-150

func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
    var result : [String] = []
    var line : [String]  = [], length = 0
    var index = 0
    
    while index < words.count {
        if length + line.count + words[index].count > maxWidth {
            //Line Complete
            
            var extraSpace = maxWidth - length
            
            let spaces = extraSpace / max(1, line.count - 1)
            var remainder = extraSpace % max(1, line.count - 1)
            
            for j in 0..<max(1, line.count - 1) {
                line[j] +=  String(repeating: " ", count: spaces)
                if remainder > 0 {
                    line[j] += " "
                    remainder -= 1
                }
            }
            result.append(line.joined(separator: ""))
            line = []
            length = 0 //reset line & length
        }
        line.append(words[index])
        length += words[index].count
        index += 1
    }
    //Handling last line
    var last_line = line.joined(separator: " ")
    var trail_Space = maxWidth - last_line.count
    
    result.append(last_line + String(repeating: " ", count: trail_Space))
    
    return result
}

print(fullJustify(["This", "is", "an", "example", "of", "text", "justification."], 16))
print(fullJustify(["What","must","be","acknowledgment","shall","be"], 16))
print(fullJustify(["Science","is","what","we","understand","well","enough","to","explain","to","a","computer.","Art","is","everything","else","we","do"], 20))
