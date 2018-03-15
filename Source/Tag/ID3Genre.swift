//
//  ID3Genre.swift
//
//  Created by Fabrizio Duroni on 04/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

/**
 An enum that contains the genres supported by the ID3 standard using specific identifiers.
 */
public enum ID3Genre: Int, Equatable {
    /// Blues genre.
    case Blues = 0
    /// Classic rock genre.
    case ClassicRock = 1
    /// Country genre.
    case Country = 2
    /// Dance genre.
    case Dance = 3
    /// Disco genre.
    case Disco = 4
    /// Funk genre.
    case Funk = 5

    case Grunge = 6
    case HipHop = 7
    case Jazz = 8
    case Metal = 9
    case NewAge = 10
    case Oldies = 11
    case Other = 12
    case Pop = 13
    case RAndB = 14
    case Rap = 15
    case Reggae = 16
    case Rock = 17
    case Techno = 18
    case Industrial = 19
    case Alternative = 20
    case Ska = 21
    case DeathMetal = 22
    case Pranks = 23
    case Soundtrack = 24
    case EuroTechno = 25
    case Ambient = 26
    case TripHop = 27
    case Vocal = 28
    case JazzFunk = 29
    case Fusion = 30
    case Trance = 31
    case Classical = 32
    case Instrumental = 33
    case Acid = 34
    case House = 35
    case Game = 36
    case SoundClip = 37
    case Gospel = 38
    case Noise = 39
    case AlternRock = 40
    case Bass = 41
    case Soul = 42
    case Punk = 43
    case Space = 44
    case Meditative = 45
    case InstrumentalPop = 46
    case InstrumentalRock = 47
    case Ethnic = 48
    case Gothic = 49
    case Darkwave = 50
    case TechnoIndustrial = 51
    case Electronic = 52
    case PopFolk = 53
    case Eurodance = 54
    case Dream = 55
    case SouthernRock = 56
    case Comedy = 57
    case Cult = 58
    case Gangsta = 59
    case Top40 = 60
    case ChristianRap = 61
    case PopFunk = 62
    case Jungle = 63
    case NativeAmerican = 64
    case Cabaret = 65
    case NewWave = 66
    case Psychadelic = 67
    case Rave = 68
    case Showtunes = 69
    case Trailer = 70
    case LoFi = 71
    case Tribal = 72
    case AcidPunk = 73
    case AcidJazz = 74
    case Polka = 75
    case Retro = 76
    case Musical = 77
    case RockAndRoll = 78
    case HardRock = 79
    case Remix = 80
    case Cover = 81

    /**
     Compare two ID3Genre.

     - parameter lhs: left side of compare operation.
     - parameter rhs: right side of compare operation.

     - returns: true if the genre values are the same, else false.
     */
    public static func ==(lhs: ID3Genre, rhs: ID3Genre) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}
