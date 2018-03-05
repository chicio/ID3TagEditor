//
//  ID3GenreStringAdapter.swift
//
//  Created by Fabrizio Duroni on 05/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3GenreStringAdapter: GenreStringAdapter {
    func adapt(genre: String) -> Genre {
        do {
            let expression = try NSRegularExpression(pattern: "(\\()\\d+(\\))")
            guard let genreWithParenthesisRange = Range(
                    expression.rangeOfFirstMatch(in: genre, options: [], range: NSMakeRange(0, genre.count)), in: genre)
                    else {
                return Genre(genre: nil, description: genre)
            }
            let genreIdentifier = adaptGenreIdentifierFrom(genreWithParenthesis: String(genre[genreWithParenthesisRange]))
            let genreDescription = adaptGenreDescriptionFrom(
                    genreDescriptionExtracted: String(genre[genreWithParenthesisRange.upperBound..<genre.endIndex])
            )
            return Genre(genre: genreIdentifier, description: genreDescription)
        } catch {
            return Genre(genre: nil, description: genre)
        }
    }

    private func adaptGenreDescriptionFrom(genreDescriptionExtracted: String) -> String? {
        var genreDescription: String? = genreDescriptionExtracted
        if let validGenreDescription = genreDescription, validGenreDescription.isEmpty {
            genreDescription = nil
        }
        return genreDescription
    }

    private func adaptGenreIdentifierFrom(genreWithParenthesis: String) -> ID3Genre? {
        let genreIdentifierStartIndex = genreWithParenthesis.index(after: genreWithParenthesis.startIndex)
        let genreIdentifierEndIndex = genreWithParenthesis.index(before: genreWithParenthesis.endIndex)
        let genreIdentifierRange = genreIdentifierStartIndex..<genreIdentifierEndIndex
        let genreWithoutParenthesis = genreWithParenthesis[genreIdentifierRange]
        if let genreIdentifier = Int(genreWithoutParenthesis),
           let validGenre = ID3Genre(rawValue: genreIdentifier) {
            return validGenre
        }
        if (genreWithoutParenthesis == "RX") {
            return .Remix
        }
        if (genreWithoutParenthesis == "CR") {
            return .Cover
        }
        return nil
    }
}
