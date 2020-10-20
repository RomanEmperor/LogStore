
import Foundation

struct LogStore {
    static var logItems: [String] = []
    /* Properties with the static keyword are stored in the type itself.
        Such properties are called type properties.
        This means we don't need to create instance of LogStore to store the log array.
        Insteas we can access it with Logstore.log
    */
}

/// Log Printing and Adding function
/// - Parameter string: A function to print string log output and add the string to the log array.
public func printLog(_ string: String) {
    print(string)
    LogStore.logItems.append(string)
}
