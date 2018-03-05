//
//  MockGenreStringAdapter.swift
//
//  Created by Fabrizio Duroni on 04/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation
@testable import ID3TagEditor

class MockGenreStringAdapter: GenreStringAdapter {
    func adapt(genre: String) -> Genre {
        return Genre(genre: .Metal, description: "Metalcore")
    }
}
