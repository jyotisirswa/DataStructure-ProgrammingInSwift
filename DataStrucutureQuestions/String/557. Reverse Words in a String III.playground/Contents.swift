import UIKit

//https://leetcode.com/problems/reverse-words-in-a-string-iii/description/


func reverseWords(_ s: String) -> String {
    var startIndex = 0
    var endIndex = 0
    var string = s
    while endIndex < string.count {
        while endIndex < string.count && string[string.index(s.startIndex, offsetBy: endIndex)] != " " {
            endIndex += 1
        }
        if startIndex < string.count {
            var firstIndex = startIndex
            var nextIndex = endIndex - 1
            while firstIndex < nextIndex {
                string.swapAt(firstIndex, nextIndex)
                firstIndex += 1
                nextIndex -= 1
            }
            endIndex += 1
            startIndex = endIndex
        }
    }
    return string
}

extension String {
    mutating func swapAt(_ index1: Int, _ index2: Int) {
        var characters = Array(self)
        characters.swapAt(index1, index2) // O(1)
        self = String(characters)
    }
}

print(reverseWords("Let's take LeetCode contest"))
print(reverseWords("@$s#^fcfavksifsa$vdi@*#xjj@iyfu(yr six)iukijr*h#zpj^&x&zbkrltog@mk#wqu%pi^a#d&*^ebjplgr$#afzyswyr!lst! e!cpcialx*hcqscwos)ap@ibtd!%(*# ipejppx@i(drwy)yzun^!#kjmqwpw^erb!pvvlx!hsvh^)&$zfyk%o#@kvktjl@wc^gleh%ak#qw*i^hv)e(^tx #m!h&trlvrvbnkxsspe%g&j#ktv*$ctqzlmpzt&d%y^rhv*"))
