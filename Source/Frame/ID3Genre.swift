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
public enum ID3Genre: Int, Equatable, Hashable, CaseIterable {
    /// Blues genre.
    case blues = 0
    /// Classic rock genre.
    case classicRock = 1
    /// Country genre.
    case country = 2
    /// Dance genre.
    case dance = 3
    /// Disco genre.
    case disco = 4
    /// Funk genre.
    case funk = 5
    /// Grunge genre.
    case grunge = 6
    /// Hip hop genre.
    case hipHop = 7
    /// Jazz genre.
    case jazz = 8
    /// Metal genre.
    case metal = 9
    /// New age genre.
    case newAge = 10
    /// Oldies genre.
    case oldies = 11
    /// Other genre.
    case other = 12
    /// Pop genre.
    case pop = 13
    /// R&B genre.
    case rAndB = 14
    /// Rap genre.
    case rap = 15
    /// Reggae genre.
    case reggae = 16
    /// Rock genre.
    case rock = 17
    /// Techno genre.
    case techno = 18
    /// Industrial genre.
    case industrial = 19
    /// Alternative genre.
    case alternative = 20
    /// Ska genre.
    case ska = 21
    /// Death metal genre.
    case deathMetal = 22
    /// Pranks genre.
    case pranks = 23
    /// Soundtrack genre.
    case soundtrack = 24
    /// Euro techno genre.
    case euroTechno = 25
    /// Ambient genre.
    case ambient = 26
    /// Tip hop genre.
    case tripHop = 27
    /// vocal genre.
    case vocal = 28
    /// Jazz funk genre.
    case jazzFunk = 29
    /// Fusion genre.
    case fusion = 30
    /// Trance genre.
    case trance = 31
    /// Classical genre.
    case classical = 32
    /// Instrumental genre.
    case instrumental = 33
    /// Acid genre.
    case acid = 34
    /// House genre.
    case house = 35
    /// Game genre.
    case game = 36
    /// Soundclip genre.
    case soundClip = 37
    /// Gospel genre.
    case gospel = 38
    /// Noise genre.
    case noise = 39
    /// Altern rock genre.
    case alternRock = 40
    /// Bass genre.
    case bass = 41
    /// Soul genre.
    case soul = 42
    /// Punk genre.
    case punk = 43
    /// Space genre.
    case space = 44
    /// Meditative genre.
    case meditative = 45
    /// Instrumental pop genre.
    case instrumentalPop = 46
    /// Instrumental rock genre.
    case instrumentalRock = 47
    /// Ethnic genre.
    case ethnic = 48
    /// Gothic genre.
    case gothic = 49
    /// Darkwave genre.
    case darkwave = 50
    /// TechnoIndustrial genre.
    case technoIndustrial = 51
    /// Electronic genre.
    case electronic = 52
    /// Pop folk genre.
    case popFolk = 53
    /// Eurodance genre.
    case eurodance = 54
    /// Dream genre.
    case dream = 55
    /// Souther rock genre.
    case southernRock = 56
    /// Comedy genre.
    case comedy = 57
    /// Cult genre.
    case cult = 58
    /// Gangsta genre.
    case gangsta = 59
    /// Top 40 genre.
    case top40 = 60
    /// Christian rap genre.
    case christianRap = 61
    /// Pop funk genre.
    case popFunk = 62
    /// Jungle genre.
    case jungle = 63
    /// Native american genre.
    case nativeAmerican = 64
    /// Cabaret genre.
    case cabaret = 65
    /// New wave genre.
    case newWave = 66
    /// Psychadelic genre.
    case psychadelic = 67
    /// Rave genre.
    case rave = 68
    /// Showtunes genre.
    case showtunes = 69
    /// Trailer genre.
    case trailer = 70
    /// Lofi genre.
    case loFi = 71
    /// Tribal genre.
    case tribal = 72
    /// Acid punk genre.
    case acidPunk = 73
    /// Acid jazz genre.
    case acidJazz = 74
    /// Polka genre.
    case polka = 75
    /// Retro genre.
    case retro = 76
    /// Musical genre.
    case musical = 77
    /// Rock and roll genre.
    case rockAndRoll = 78
    /// Hard rock genre.
    case hardRock = 79
    /// Remix genre.
    case remix = 80
    /// Cover genre.
    case cover = 81
}
