/**

 https://leetcode.com/problems/logger-rate-limiter/submissions/
Design a logger system that receives a stream of messages along with their timestamps. Each unique message should only be printed at most every 10 seconds (i.e. a message printed at timestamp t will prevent other identical messages from being printed until timestamp t + 10).

All messages will come in chronological order. Several messages may arrive at the same timestamp.

Implement the Logger class:

Logger() Initializes the logger object.
bool shouldPrintMessage(int timestamp, string message) Returns true if the message should be printed in the given timestamp, otherwise returns false.
 

Example 1:

Input
["Logger", "shouldPrintMessage", "shouldPrintMessage", "shouldPrintMessage", "shouldPrintMessage", "shouldPrintMessage", "shouldPrintMessage"]
[[], [1, "foo"], [2, "bar"], [3, "foo"], [8, "bar"], [10, "foo"], [11, "foo"]]
Output
[null, true, true, false, false, false, true]

Explanation
Logger logger = new Logger();
logger.shouldPrintMessage(1, "foo");  // return true, next allowed timestamp for "foo" is 1 + 10 = 11
logger.shouldPrintMessage(2, "bar");  // return true, next allowed timestamp for "bar" is 2 + 10 = 12
logger.shouldPrintMessage(3, "foo");  // 3 < 11, return false
logger.shouldPrintMessage(8, "bar");  // 8 < 12, return false
logger.shouldPrintMessage(10, "foo"); // 10 < 11, return false
logger.shouldPrintMessage(11, "foo"); // 11 >= 11, return true, next allowed timestamp for "foo" is 11 + 10 = 21
 

Constraints:

0 <= timestamp <= 109
Every timestamp will be passed in non-decreasing order (chronological order).
1 <= message.length <= 30
At most 104 calls will be made to shouldPrintMessage.

Solution:

First we need to create a signleton class to store the messages and their timestamps.
After that we need to create hashtable for keep the messages and their timestamps. But we only keep the printed messages and their timestamps in the hashtable.
When user send a new message first we check the hashtable if it is not exist in hashtable then we add it to the hashtable. and return true.
If it is exist in hashtable then we check the timestamp if it is less than the current timestamp + 10 then we return false.
If it is greater than the current timestamp + 10 then we change the timestamp and return true.

 */
class Logger {
    var logMessages: [String: Int] = [:]
    static let shared: Logger = {
        let instance = Logger()
        return instance
    }()

    init() {
    }

    func shouldPrintMessage(_ timestamp: Int, _ message: String) -> Bool {
        guard let time = logMessages[message] else {
            logMessages[message] = timestamp
            return true
        }
        if time + 10 <= timestamp {
            logMessages[message] = timestamp
            return true
        } else {
            return false
        }
    }
}

/**
 * Your Logger object will be instantiated and called as such:
 * let obj = Logger()
 * let ret_1: Bool = obj.shouldPrintMessage(timestamp, message)
 */