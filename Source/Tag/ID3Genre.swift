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
    /// Grunge genre.
    case Grunge = 6
    /// Hip hop genre.
    case HipHop = 7
    /// Jazz genre.
    case Jazz = 8
    /// Metal genre.
    case Metal = 9
    /// New age genre.
    case NewAge = 10
    /// Oldies genre.
    case Oldies = 11
    /// Other genre.
    case Other = 12
    /// Pop genre.
    case Pop = 13
    /// R&B genre.
    case RAndB = 14
    /// Rap genre.
    case Rap = 15
    /// Reggae genre.
    case Reggae = 16
    /// Rock genre.
    case Rock = 17
    /// Techno genre.
    case Techno = 18
    /// Industrial genre.
    case Industrial = 19
    /// Alternative genre.
    case Alternative = 20
    /// Ska genre.
    case Ska = 21
    /// Death metal genre.
    case DeathMetal = 22
    /// Pranks genre.
    case Pranks = 23
    /// Soundtrack genre.
    case Soundtrack = 24
    /// Euro techno genre.
    case EuroTechno = 25
    /// Ambient genre.
    case Ambient = 26
    /// Tip hop genre.
    case TripHop = 27
    /// vocal genre.
    case Vocal = 28
    /// Jazz funk genre.
    case JazzFunk = 29
    /// Fusion genre.
    case Fusion = 30
    /// Trance genre.
    case Trance = 31
    /// Classical genre.
    case Classical = 32
    /// Instrumental genre.
    case Instrumental = 33
    /// Acid genre.
    case Acid = 34
    /// House genre.
    case House = 35
    /// Game genre.
    case Game = 36
    /// Soundclip genre.
    case SoundClip = 37
    /// Gospel genre.
    case Gospel = 38
    /// Noise genre.
    case Noise = 39
    /// Altern rock genre.
    case AlternRock = 40
    /// Bass genre.
    case Bass = 41
    /// Soul genre.
    case Soul = 42
    /// Punk genre.
    case Punk = 43
    /// Space genre.
    case Space = 44
    /// Meditative genre.
    case Meditative = 45
    /// Instrumental pop genre.
    case InstrumentalPop = 46
    /// Instrumental rock genre.
    case InstrumentalRock = 47
    /// Ethnic genre.
    case Ethnic = 48
    /// Gothic genre.
    case Gothic = 49
    /// Darkwave genre.
    case Darkwave = 50
    /// TechnoIndustrial genre.
    case TechnoIndustrial = 51
    /// Electronic genre.
    case Electronic = 52
    /// Pop folk genre.
    case PopFolk = 53
    /// Eurodance genre.
    case Eurodance = 54
    /// Dream genre.
    case Dream = 55
    /// Souther rock genre.
    case SouthernRock = 56
    /// Comedy genre.
    case Comedy = 57
    /// Cult genre.
    case Cult = 58
    /// Gangsta genre.
    case Gangsta = 59
    /// Top 40 genre.
    case Top40 = 60
    /// Christian rap genre.
    case ChristianRap = 61
    /// Pop funk genre.
    case PopFunk = 62
    /// Jungle genre.
    case Jungle = 63
    /// Native american genre.
    case NativeAmerican = 64
    /// Cabaret genre.
    case Cabaret = 65
    /// New wave genre.
    case NewWave = 66
    /// Psychadelic genre.
    case Psychadelic = 67
    /// Rave genre.
    case Rave = 68
    /// Showtunes genre.
    case Showtunes = 69
    /// Trailer genre.
    case Trailer = 70
    /// Lofi genre.
    case LoFi = 71
    /// Tribal genre.
    case Tribal = 72
    /// Acid punk genre.
    case AcidPunk = 73
    /// Acid jazz genre.
    case AcidJazz = 74
    /// Polka genre.
    case Polka = 75
    /// Retro genre.
    case Retro = 76
    /// Musical genre.
    case Musical = 77
    /// Rock and roll genre.
    case RockAndRoll = 78
    /// Hard rock genre.
    case HardRock = 79
    /// Remix genre.
    case Remix = 80
    /// Cover genre.
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
