/**
Given an m x n grid of characters board and a string word, return true if word exists in the grid.

The word can be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once.

 

Example 1:


Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
Output: true
Example 2:


Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "SEE"
Output: true
Example 3:


Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCB"
Output: false
 

Constraints:

m == board.length
n = board[i].length
1 <= m, n <= 6
1 <= word.length <= 15
board and word consists of only lowercase and uppercase English letters.
 

Follow up: Could you use search pruning to make your solution faster with a larger board?
 */

class Solution {
    let dirs = [[0,1],[0,-1],[1,0],[-1,0]]

    func exist(_ board: [[Character]], _ word: String) -> Bool {
	
        guard !board.isEmpty, !word.isEmpty else {return false}
		
        let wordArray = Array(word)
        var board = board
        for i in 0..<board.count{
            for j in 0..<board[i].count{
                if board[i][j] == wordArray[0] {
                    if doesWordExist(&board,wordArray, i:i,j:j, wordIndex : 0){ return true }
                }
            }
        }
        return false
    }
        
    func doesWordExist(_ board: inout [[Character]], _ word: [Character] , i:Int, j:Int, wordIndex : Int) -> Bool{

        if wordIndex == word.count{
            return true
        }
        
        guard i >= 0 , i < board.count , j >= 0 , j < board[0].count , board[i][j] == word[wordIndex] else {return false}
        
        board[i][j] = "x"
		
        for dir in dirs{
            let newI = dir[0] + i
            let newJ = dir[1] + j
            if doesWordExist(&board,word, i:newI,j:newJ, wordIndex : wordIndex+1) {return true}
        }
		
        board[i][j] = word[wordIndex]
        return false
    }
}