import Foundation

internal protocol FrameParser {
    var frameName: FrameName { get }
}

extension FrameParser {
    
    internal func extractHeader(from frameData: inout Data.SubSequence, version: ID3Version) {
        let name = frameData.extractFirst(version.identifierSize)
        assert(
            String(ascii: name) == frameName.identifier(version: version),
            "Mismatched frame name: \(String(ascii: name)) ≠ \(String(describing: frameName.identifier))"
        )
        _ = frameData.extractFirst(version.sizeSize)
        _ = frameData.extractFirst(version.flagSize)
    }
    
    internal func extractEncoding(from frameData: inout Data.SubSequence) -> ID3StringEncoding {
        #warning("Should be able to throw or otherwise signal that the encoding flag was invalid. Falling back to the most standard encoding could cause trouble down the line.")
        return frameData.extractFirst(1).first.flatMap({ ID3StringEncoding(rawValue: $0) })
            ?? .utf8
    }
    
    internal func extractDescriptionAndValue(
        from frameData: inout Data.SubSequence,
        encoding: ID3StringEncoding
    ) -> (description: String?, value: String) {
        let description = frameData.extractPrefixAsStringUntilNullTermination(encoding)
        #warning("Upon encoding failure, this falls back to an empty string, losing information. It ought to throw or something instead.")
        let content = frameData.extractPrefixAsStringUntilNullTermination(encoding) ?? ""
        return (description: description, value: content)
    }
    
    internal func extractCreditStrings(
        from frameData: inout Data.SubSequence,
        encoding: ID3StringEncoding
    ) -> [(String, String)] {
        var strings: [String] = []
        
        while !frameData.isEmpty,
            let next = frameData.extractPrefixAsStringUntilNullTermination(encoding) {
                strings.append(next)
        }
        let rolePersonArray = strings.pairs()
        return rolePersonArray as! [(String, String)]
    }
    
}
