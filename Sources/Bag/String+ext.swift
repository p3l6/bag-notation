//
//  String+ext.swift
//  Bag Notation
//

extension String {

    
    /// Replaces a file extension at the end of this string.
    ///
    /// - Note: If the file extension specified is not present at the end, the new extension is simple appended.
    /// - Parameters:
    ///   - old: The existing file extension to match on.
    ///   - new: Replacement extension
    /// - Returns: A copy of the string with a modified (or appended) file extension.
    func replacingExtension(_ old: String, with new: String) -> String {
        var path = self
        if path.hasSuffix(old) {
            path.removeLast(old.count)
        }
        if path.hasSuffix(".") {
            path.removeLast()
        }
        return path.appending(".\(new)")
    }
}
