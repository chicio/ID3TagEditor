//
//  BookPositioninSeries.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

/**
 A class used to represent a book position in a series, using a custom ID3 tag.
 */
public class ID3FrameSeriesIndex: ID3Frame, Equatable, CustomDebugStringConvertible {
    /// The index of the book.
    public var index: Int
    /// The total number of books in series.
    public var totalBooks: Int?
    /// BookIndexinSeries description, useful for debug.
    public var debugDescription: String {
        return "\(index) of \(totalBooks != nil ? String(totalBooks!) : "-")"
    }

    /**
     Init an ID3 book index frame.

     - parameter index: the book index.
     - parameter totalBooks: the total books of the series.
     */
    public init(index: Int, totalBooks: Int?) {
        self.index = index
        self.totalBooks = totalBooks
    }

    /**
     Compare two BookIndicesInSeries.

     - parameter lhs: left side of compare operation.
     - parameter rhs: right side of compare operation.

     - returns: true if the book index values are the same, else false.
     */
    public static func ==(lhs: ID3FrameSeriesIndex, rhs: ID3FrameSeriesIndex) -> Bool {
        return lhs.index == rhs.index && lhs.totalBooks == rhs.totalBooks
    }
}
