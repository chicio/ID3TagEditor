//
//  UserDefinedTextStringAdapter.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/13/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

protocol UserDefinedTextStringAdapter {
    func adapt(content: String) -> ID3FrameUserDefinedText
}
