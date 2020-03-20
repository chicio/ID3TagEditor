//
//  Languages.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/14/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

enum languages: String {
    
    /// Undefined
    case Undefined
    /// Montenegrin
    case Montenegrin
    /// Standard Moroccan Tamazight
    case StandardMoroccanTamazight
    /// Hmong; Mong
    case Hmong
    /// Hmong; Mong
    case Mong
    /// Bihari languages
    case BihariLanguage
    /// Himachali languages; Western Pahari languages
    case HimachaliLanguages
    /// Himachali languages; Western Pahari languages
    case WesternPahariLanguages
    /// Afro-Asiatic languages
    case AfroAsiaticLanguage
    /// Apache Languages
    case ApacheLanguages
    /// Artificial Languages
    case ArtificialLanguages
    /// Bamileke Languages
    case BamilekeLanguages
    /// Baltic Languages
    case BalticLanguages
    /// Berber Languages
    case BerberLanguages
    /// Bantu Languages
    case BantuLanguages
    /// Central American Indian Languages
    case CentralAmericanIndianLanguages
    /// Caucasian Languages
    case CaucasianLanguages
    /// Celtic Languages
    case CelticLanguages
    /// Creoles and Pidgins; English-based
    case EnglishCreolesAndPidgins
    /// Creoles and Pidgins; French-based
    case FrenchCreolesAndPidgins
    /// Creoles and Pidgins, Portugese-based
    case PortugeseCreolesAndPidgins
    /// Creoles and Pidgins
    case CreolesAndPidgins
    /// Cushitic Languages
    case CushiticLanguages
    /// Dravidian Languages
    case DravidianLanguages
    /// Finno-Ugrian Languages
    case FinnoUgrianLanguages
    /// Germanic Languages
    case GermanicLanguages
    /// Indic Languages
    case IndicLanguages
    /// Indi-European Languages
    case IndoEuropeanLanguages
    /// Iranian Languages
    case IranianLanguages
    /// Iroquoian Languages
    case IroquoianLanguages
    /// Khoisan Languages
    case KhoisanLanguages
    /// Austronesian Languages
    case AustronesianLanguages
    /// Mon-Khmer Languages
    case MonKhmerLanguages
    /// North American Indian Languages
    case NorthAmericanIndianLanguages
    /// Niger-Kordofian Languages
    case NigerKordofianLanguages
    /// Otomian Languages
    case OtomianLanguages
    /// Papuan Languages
    case PapuanLanguages
    /// Philippine Languages
    case PhilippineLanguages
    /// Prakrit Languages
    case PrakritLanguages
    /// Romance Languages
    case RomanceLanguages
    /// South American Indian Languages
    case SouthAmericanIndianLanguages
    /// Salishan Languages
    case SalishanLanguages
    /// Semitic Languages
    case SemiticLanguages
    /// Sino-Tibetan Languages
    case SinoTibetanLanguages
    /// SlavicLanguages
    case SlavicLanguages
    /// Sami Languages
    case SamiLanguages
    /// Nilo-Saharan Languages
    case NiloSaharanLanguages
    /// Tai Languages
    case TaiLanguages
    /// Altaic Languages
    case AltaicLanguages
    /// Wakasha Languages
    case WakashaLanguages
    /// Moldavian; Moldovan
    case Moldavian
    /// Moldavian; Moldovan
    case Moldavan
    /// Khotanese; Sakan
    case Khotanese
    /// Khotanese; Sakan
    case Sakan
    /// Occitan (post 1500)
    case Occitan
    /// Provençal, Old (to 1500); Occitan, Old (to 1500)
    case Provençal
    /// Wolaitta; Wolaytta
    case Walaitta
    /// Wolaitta; Wolaytta
    case Wolaytta
    /// Serbian
    case Serbian
    /// Croatian
    case Croatian
    /// No Linguistic Content
    case NotApplicable
    /// Swiss German; Alemannic; Alsatian
    case SwissGerman
    /// Swiss German; Alemannic; Alsatian
    case Alemannic
    /// Swiss German; Alemannic; Alsatian
    case Alsatian
    /// Pushto; Pashto
    case Pushto
    /// Pushto; Pashto
    case Pashto
    /// Asturian; Bable; Leonese; Asturleonese
    case Asturian
    /// Asturian; Bable; Leonese; Asturleonese
    case Bable
    /// Asturian; Bable; Leonese; Asturleonese
    case Leonese
    /// Asturian; Bable; Leonese; Asturleonese
    case Asturleonese
    /// Beja; Bedawiyet
    case Beja
    /// Beja; Bedawiyet
    case Bedawiyet
    /// Chipewyan; Dene Suline
    case Chipewyan
    /// Chipewyan; Dene Suline
    case DeneSuline
    /// Sichuan Yi; Nuosu
    case SichuanYi
    /// Sichuan Yi; Nuosu
    case Nuosu
    /// Interlingue; Occidental
    case Interlingue
    /// Interlingue; Occidental
    case Occidental
    /// Pampanga; Kapampangan
    case Pampanga
    /// Pampanga; Kapampangan
    case Kapampangan
    /// Blissymbols; Blissymbolics; Bliss"
    case Blissymbols
    /// Blissymbols; Blissymbolics; Bliss"
    case Blissymbolics
    /// Blissymbols; Blissymbolics; Bliss"
    case Bliss
    /// Uncoded Languages
    case UncodedLanguages
    /// Official Aramaic (700-300 BCE); Imperial Aramaic (700-300 BCE)
    case OfficialAramaic
    /// Official Aramaic (700-300 BCE); Imperial Aramaic (700-300 BCE)
    case ImperialAramaic
    /// case Classical Syriac
    case ClassicalSyriac
    /// Bini; Edo
    case Bini
    /// Bini; Edo
    case Edo
    /// Galibi Carib
    case Galibi
    /// Galibi Carib
    case Carib
    /// Banda languages
    case BandaLanguages
    /// Batak languages
    case BatakLanguages
    /// Land Dayak languages
    case LandDayakLanguages
    /// Ijo languages
    case IjoLanguages
    /// Karen languages
    case KarenLanguages
    /// Kru languages
    case KruLanguages
    /// Nahuatl languages
    case NahuatlLanguages
    /// Songhai languages
    case SonghaiLanguages
    /// Sranan Tongo
    case SrananTongo
    /// Zande languages
    case ZandeLanguages
    /// Kachin; Jingpho
    case Kachin
    /// Kachin; Jingpho
    case Jingpho
    /// Central Khmer
    case CentralKhmer
    /// Mapudungun; Mapuche
    case Mapudungun
    /// Mapudungun; Mapuche
    case Mapuche
    /// Rarotongan; Cook Islands Maori
    case Rarotongan
    /// Rarotongan; Cook Islands Maori
    case CookIslandsMaori
    /// Romansh
    case Romansh
    /// Kirghiz; Kyrgyz
    case Kirghiz
    /// Kirghiz; Kyrgyz
    case Kyrgyz
    /// Zaza; Dimili; Dimli; Kirdki; Kirmanjki; Zazaki
    case Zaza
    /// Zaza; Dimili; Dimli; Kirdki; Kirmanjki; Zazaki
    case Dimili
    /// Zaza; Dimili; Dimli; Kirdki; Kirmanjki; Zazaki
    case Dimli
    /// Zaza; Dimili; Dimli; Kirdki; Kirmanjki; Zazaki
    case Kirdki
    /// Zaza; Dimili; Dimli; Kirdki; Kirmanjki; Zazaki
    case Kirmanjki
    /// Zaza; Dimili; Dimli; Kirdki; Kirmanjki; Zazaki
    case Zazaki
    /// Divehi; Dhivehi; Maldivian
    case Divehi
    /// Divehi; Dhivehi; Maldivian
    case Dhivehi
    /// Divehi; Dhivehi; Maldivian
    case Maldivian
    /// N'Ko
    case NKo
    /// Karelian
    case Karelian
    /// Eastern Frisian
    case EasternFrisian
    /// Western Frisian
    case WesternFrisian
    /// Angika
    case Angika
    /// Northern Frisian
    case NorthernFrisian
    /// Aromanian; Arumanian; Macedo-Romanian
    case Aromanian
    /// Aromanian; Arumanian; Macedo-Romanian
    case Arumianian
    /// Aromanian; Arumanian; Macedo-Romanian
    case MacedoRomanian
    /// Ainu
    case Ainu
    /// Galician
    case Galician
    /// Southern Altai
    case SouthernAltai
    /// Kalmyk; Oirat
    case Kalmyk
    /// Kalmyk; Oirat
    case Oirat
    /// Mi'kmaq; Micmac
    case Mikmaq
    /// Mi'kmaq; Micmac
    case Micmac
    /// Pedi; Sepedi; Northern Sotho
    case Pedi
    /// Pedi; Sepedi; Northern Sotho
    case Sepedi
    /// Pedi; Sepedi; Northern Sotho
    case NorthernSotho
    /// Sinhala; Sinhalese
    case Sinhala
    /// Sinhala; Sinhalese
    case Sinhalese
    /// Filipino; Pilipino
    case Filipino
    /// Filipino; Pilipino
    case Philipino
    /// Mirandese
    case Mirandese
    /// Sicilian
    case Sicilian
    /// Classical Newari; Old Newari; Classical Nepal Bhasa
    case ClassicalNewari
    /// Classical Newari; Old Newari; Classical Nepal Bhasa
    case OldNewari
    /// Classical Newari; Old Newari; Classical Nepal Bhasa
    case ClassicalNepalBhasa
    /// Blin; Bilin
    case Blin
    /// Blin; Bilin
    case Bilin
    /// Lojban
    case Lojban
    /// Lower Sorbian
    case LowerSorbian
    /// Upper Sorbian
    case UpperSorbian
    /// Kashubian
    case Kashubian
    /// Crimean Tatar; Crimean Turkish
    case CrimeanTatar
    /// Crimean Tatar; Crimean Turkish
    case CrimeanTurkish
    /// Adyghe; Adygei
    case Adyghe
    /// Adyghe; Adygei
    case Adygei
    /// Karachay-Balkar
    case KarachayBalkar
    /// Moksha
    case Moksha
    /// Erzya
    case Erzya
    /// Udmurt
    case Udmurt
    /// Dargwa
    case Dargwa
    /// Ingush
    case Ingush
    /// Nogai
    case Nogai
    /// Haitian; Haitian Creole
    case Haitian
    /// Haitian; Haitian Creole
    case HaitianCreole
    /// Kabardian
    case Kabardian
    /// Aragonese
    case Aragonese
    /// Limburgan; Limburger; Limburgish
    case Limburgan
    /// Limburgan; Limburger; Limburgish
    case Limburger
    /// Limburgan; Limburger; Limburgish
    case Limburgish
    /// Neapolitan
    case Neapolitan
    /// Southern Sami
    case SouthernSami
    /// Lule Sami
    case LuleSami
    /// Inari Sami
    case InariSami
    /// Skolt Sami
    case SkoltSami
    /// Walloon
    case Walloon
    /// Ido
    case Ido
    /// Tupi languages
    case TupiLanguages
    /// Javanese
    case Javanese
    /// Ndebele, South; South Ndebele
    case SouthNdebele
    /// Ndebele, North; North Ndebele
    case NorthNdebele
    /// Low German; Low Saxon; German, Low; Saxon, Low
    case LowGerman
    /// Low German; Low Saxon; German, Low; Saxon, Low
    case LowSaxon
    /// Avestan
    case Avestan
    /// Bambara
    case Bambara
    /// Bosnian
    case Bosnian
    /// Chamorro
    case Chamorro
    /// Chechen
    case Chechen
    /// Church Slavic; Old Slavonic; Church Slavonic; Old Bulgarian; Old Church Slavonic
    case ChurchSlavic
    /// Church Slavic; Old Slavonic; Church Slavonic; Old Bulgarian; Old Church Slavonic
    case OldSlavic
    /// Church Slavic; Old Slavonic; Church Slavonic; Old Bulgarian; Old Church Slavonic
    case OldBulgarian
    /// Chuvash
    case Chuvash
    /// Herero
    case Herero
    /// Hiri Motu
    case HiriMotu
    /// Kikuyu; Gikuyu
    case Kikuyu
    /// Kikuyu; Gikuyu
    case Gikuyu
    /// Komi
    case Komi
    /// Kuanyama; Kwanyama
    case Kuanyama
    /// Kuanyama; Kwanyama
    case Kwanyama
    /// Marshallese
    case Marshallese
    /// Manchu
    case Manchu
    /// Navajo; Navaho
    case Navajo
    /// Navajo; Navaho
    case Navaho
    /// Ndonga
    case Ndonga
    /// Norwegian Nynorsk; Nynorsk, Norwegian
    case NorwegianNynorsk
    /// Bokmål, Norwegian; Norwegian Bokmål
    case NorwegianBokmål
    /// Chichewa; Chewa; Nyanja
    case Chichewa
    /// Chichewa; Chewa; Nyanja
    case Chewa
    /// Chichewa; Chewa; Nyanja
    case Nyanja
    /// Ossetian; Ossetic
    case Ossetian
    /// Pali
    case Pali
    /// Sign Languages
    case SignLanguages
    /// Northern Sami
    case NorthernSami
    /// Sardinian
    case Sardinian
    /// Tahitian
    case Tahitian
    /// Akan
    case Akan
    /// Avaric
    case Avaric
    /// Cree
    case Cree
    /// Ewe
    case Ewe
    /// Fulah
    case Fuljah
    /// Igbo
    case Igbo
    /// Kanuri
    case Kanuri
    /// Kongo
    case Kongo
    /// Luba-Katanga
    case LubaKatanga
    /// Ganda
    case Ganda
    /// Ojibwa
    case Ojibwa
    /// Venda
    case Venda
    /// Cornish
    case Cornish
    /// Manx
    case Manx
    /// Luxembourgish; Letzeburgesch
    case Luxembourgish
    /// Luxembourgish; Letzeburgesch
    case Letzeburgesch
    /// Hebrew
    case Hebrew
    /// Inuktitut
    case Inuktitut
    /// Indonesian
    case Indonesian
    /// Uighur; Uyghur
    case Uighru
    /// Uighur; Uyghur
    case Uyghur
    /// Yiddish
    case Yiddish
    /// Zhuang; Chuang
    case Zhuang
    /// Zhuang; Chuang
    case Chuang
    
    public var languageCodes: String {
        switch self {
            case .Undefined:
                return ISO_639_2_Codes.und.rawValue
            case .Montenegrin:
                return ISO_639_2_Codes.cnr.rawValue
            case .StandardMoroccanTamazight:
                return ISO_639_2_Codes.zgh.rawValue
            case .Hmong:
                return ISO_639_2_Codes.hmn.rawValue
            case .Mong:
                return ISO_639_2_Codes.hmn.rawValue
            case .BihariLanguage:
                return ISO_639_2_Codes.bih.rawValue
            case .HimachaliLanguages:
                return ISO_639_2_Codes.him.rawValue
            case .WesternPahariLanguages:
                return ISO_639_2_Codes.him.rawValue
            case .AfroAsiaticLanguage:
                return ISO_639_2_Codes.afa.rawValue
            case .ApacheLanguages:
                return ISO_639_2_Codes.apa.rawValue
            case .ArtificialLanguages:
                return ISO_639_2_Codes.art.rawValue
            case .BamilekeLanguages:
                return ISO_639_2_Codes.bai.rawValue
            case .BalticLanguages:
                return ISO_639_2_Codes.bat.rawValue
            case .BerberLanguages:
                return ISO_639_2_Codes.ber.rawValue
            case .BantuLanguages:
                return ISO_639_2_Codes.bnt.rawValue
            case .CentralAmericanIndianLanguages:
                return ISO_639_2_Codes.cai.rawValue
            case .CaucasianLanguages:
                return ISO_639_2_Codes.cau.rawValue
            case .CelticLanguages:
                return ISO_639_2_Codes.cel.rawValue
            case .EnglishCreolesAndPidgins:
                return ISO_639_2_Codes.cpe.rawValue
            case .FrenchCreolesAndPidgins:
                return ISO_639_2_Codes.cpf.rawValue
            case .PortugeseCreolesAndPidgins:
                return ISO_639_2_Codes.cpp.rawValue
            case .CreolesAndPidgins:
                return ISO_639_2_Codes.crp.rawValue
            case .CushiticLanguages:
                return ISO_639_2_Codes.cus.rawValue
            case .DravidianLanguages:
                return ISO_639_2_Codes.dra.rawValue
            case .FinnoUgrianLanguages:
                return ISO_639_2_Codes.fiu.rawValue
            case .GermanicLanguages:
                return ISO_639_2_Codes.gem.rawValue
            case .IndicLanguages:
                return ISO_639_2_Codes.inc.rawValue
            case .IndoEuropeanLanguages:
                return ISO_639_2_Codes.ine.rawValue
            case .IranianLanguages:
                return ISO_639_2_Codes.ira.rawValue
            case .IroquoianLanguages:
                return ISO_639_2_Codes.iro.rawValue
            case .KhoisanLanguages:
                return ISO_639_2_Codes.khi.rawValue
            case .AustronesianLanguages:
                return ISO_639_2_Codes.map.rawValue
            case .MonKhmerLanguages:
                return ISO_639_2_Codes.mkh.rawValue
            case .NorthAmericanIndianLanguages:
                return ISO_639_2_Codes.nai.rawValue
            case .NigerKordofianLanguages:
                return ISO_639_2_Codes.nic.rawValue
            case .OtomianLanguages:
                return ISO_639_2_Codes.oto.rawValue
            case .PapuanLanguages:
                return ISO_639_2_Codes.paa.rawValue
            case .PhilippineLanguages:
                return ISO_639_2_Codes.phi.rawValue
            case .PrakritLanguages:
                return ISO_639_2_Codes.pra.rawValue
            case .RomanceLanguages:
                return ISO_639_2_Codes.roa.rawValue
            case .SouthAmericanIndianLanguages:
                return ISO_639_2_Codes.sai.rawValue
            case .SalishanLanguages:
                return ISO_639_2_Codes.sal.rawValue
            case .SemiticLanguages:
                return ISO_639_2_Codes.sem.rawValue
            case .SinoTibetanLanguages:
                return ISO_639_2_Codes.sit.rawValue
            case .SlavicLanguages:
                return ISO_639_2_Codes.sla.rawValue
            case .SamiLanguages:
                return ISO_639_2_Codes.smi.rawValue
            case .NiloSaharanLanguages:
                return ISO_639_2_Codes.ssa.rawValue
            case .TaiLanguages:
                return ISO_639_2_Codes.tai.rawValue
            case .AltaicLanguages:
                return ISO_639_2_Codes.tut.rawValue
            case .WakashaLanguages:
                return ISO_639_2_Codes.wak.rawValue
            case .Moldavian:
                return ISO_639_2_Codes.mol.rawValue
            case .Moldavan:
                return ISO_639_2_Codes.mol.rawValue
            case .Khotanese:
                return ISO_639_2_Codes.kho.rawValue
            case .Sakan:
                return ISO_639_2_Codes.kho.rawValue
            case .Occitan:
                return ISO_639_2_Codes.oci.rawValue
            case .Provençal:
                return ISO_639_2_Codes.pro.rawValue
            case .Walaitta:
                return ISO_639_2_Codes.wal.rawValue
            case .Wolaytta:
                return ISO_639_2_Codes.wal.rawValue
            case .Serbian:
                return ISO_639_2_Codes.srp.rawValue
            case .Croatian:
                return ISO_639_2_Codes.hrv.rawValue
            case .NotApplicable:
                return ISO_639_2_Codes.zxx.rawValue
            case .SwissGerman:
                return ISO_639_2_Codes.gsw.rawValue
            case .Alemannic:
                return ISO_639_2_Codes.gsw.rawValue
            case .Alsatian:
                return ISO_639_2_Codes.gsw.rawValue
            case .Pushto:
                return ISO_639_2_Codes.pus.rawValue
            case .Pashto:
                return ISO_639_2_Codes.pus.rawValue
            case .Asturian:
                return ISO_639_2_Codes.ast.rawValue
            case .Bable:
                return ISO_639_2_Codes.ast.rawValue
            case .Leonese:
                return ISO_639_2_Codes.ast.rawValue
            case .Asturleonese:
                return ISO_639_2_Codes.ast.rawValue
            case .Beja:
                return ISO_639_2_Codes.bej.rawValue
            case .Bedawiyet:
                return ISO_639_2_Codes.bej.rawValue
            case .Chipewyan:
                return ISO_639_2_Codes.chp.rawValue
            case .DeneSuline:
                return ISO_639_2_Codes.chp.rawValue
            case .SichuanYi:
                return ISO_639_2_Codes.iii.rawValue
            case .Nuosu:
                return ISO_639_2_Codes.iii.rawValue
            case .Interlingue:
                return ISO_639_2_Codes.ile.rawValue
            case .Occidental:
                return ISO_639_2_Codes.ile.rawValue
            case .Pampanga:
                return ISO_639_2_Codes.pam.rawValue
            case .Kapampangan:
                return ISO_639_2_Codes.pam.rawValue
            case .Blissymbols:
                return ISO_639_2_Codes.zbl.rawValue
            case .Blissymbolics:
                return ISO_639_2_Codes.zbl.rawValue
            case .Bliss:
                return ISO_639_2_Codes.zbl.rawValue
            case .UncodedLanguages:
                return ISO_639_2_Codes.mis.rawValue
            case .OfficialAramaic:
                return ISO_639_2_Codes.arc.rawValue
            case .ImperialAramaic:
                return ISO_639_2_Codes.arc.rawValue
            case .ClassicalSyriac:
                return ISO_639_2_Codes.syc.rawValue
            case .Bini:
                return ISO_639_2_Codes.bin.rawValue
            case .Edo:
                return ISO_639_2_Codes.bin.rawValue
            case .Galibi:
                return ISO_639_2_Codes.car.rawValue
            case .Carib:
                return ISO_639_2_Codes.car.rawValue
            case .BandaLanguages:
                return ISO_639_2_Codes.bad.rawValue
            case .BatakLanguages:
                return ISO_639_2_Codes.btk.rawValue
            case .LandDayakLanguages:
                return ISO_639_2_Codes.day.rawValue
            case .IjoLanguages:
                return ISO_639_2_Codes.ijo.rawValue
            case .KarenLanguages:
                return ISO_639_2_Codes.kar.rawValue
            case .KruLanguages:
                return ISO_639_2_Codes.kro.rawValue
            case .NahuatlLanguages:
                return ISO_639_2_Codes.nah.rawValue
            case .SonghaiLanguages:
                return ISO_639_2_Codes.son.rawValue
            case .SrananTongo:
                return ISO_639_2_Codes.srn.rawValue
            case .ZandeLanguages:
                return ISO_639_2_Codes.znd.rawValue
            case .Kachin:
                return ISO_639_2_Codes.kac.rawValue
            case .Jingpho:
                return ISO_639_2_Codes.kac.rawValue
            case .CentralKhmer:
                return ISO_639_2_Codes.khm.rawValue
            case .Mapudungun:
                return ISO_639_2_Codes.arn.rawValue
            case .Mapuche:
                return ISO_639_2_Codes.arn.rawValue
            case .Rarotongan:
                return ISO_639_2_Codes.rar.rawValue
            case .CookIslandsMaori:
                return ISO_639_2_Codes.rar.rawValue
            case .Romansh:
                return ISO_639_2_Codes.roh.rawValue
            case .Kirghiz:
                return ISO_639_2_Codes.kir.rawValue
            case .Kyrgyz:
                return ISO_639_2_Codes.kir.rawValue
            case .Zaza:
                return ISO_639_2_Codes.zza.rawValue
            case .Dimili:
                return ISO_639_2_Codes.zza.rawValue
            case .Dimli:
                return ISO_639_2_Codes.zza.rawValue
            case .Kirdki:
                return ISO_639_2_Codes.zza.rawValue
            case .Kirmanjki:
                return ISO_639_2_Codes.zza.rawValue
            case .Zazaki:
                return ISO_639_2_Codes.zza.rawValue
            case .Divehi:
                return ISO_639_2_Codes.div.rawValue
            case .Dhivehi:
                return ISO_639_2_Codes.div.rawValue
            case .Maldivian:
                return ISO_639_2_Codes.div.rawValue
            case .NKo:
                return ISO_639_2_Codes.nqo.rawValue
            case .Karelian:
                return ISO_639_2_Codes.krl.rawValue
            case .EasternFrisian:
                return ISO_639_2_Codes.frs.rawValue
            case .WesternFrisian:
                return ISO_639_2_Codes.fry.rawValue
            case .Angika:
                return ISO_639_2_Codes.anp.rawValue
            case .NorthernFrisian:
                return ISO_639_2_Codes.frr.rawValue
            case .Aromanian:
                return ISO_639_2_Codes.rup.rawValue
            case .Arumianian:
                return ISO_639_2_Codes.rup.rawValue
            case .MacedoRomanian:
                return ISO_639_2_Codes.rup.rawValue
            case .Ainu:
                return ISO_639_2_Codes.ain.rawValue
            case .Galician:
                return ISO_639_2_Codes.glg.rawValue
            case .SouthernAltai:
                return ISO_639_2_Codes.alt.rawValue
            case .Kalmyk:
                return ISO_639_2_Codes.xal.rawValue
            case .Oirat:
                return ISO_639_2_Codes.xal.rawValue
            case .Mikmaq:
                return ISO_639_2_Codes.mic.rawValue
            case .Micmac:
                return ISO_639_2_Codes.mic.rawValue
            case .Pedi:
                return ISO_639_2_Codes.nso.rawValue
            case .Sepedi:
                return ISO_639_2_Codes.nso.rawValue
            case .NorthernSotho:
                return ISO_639_2_Codes.nso.rawValue
            case .Sinhala:
                return ISO_639_2_Codes.sin.rawValue
            case .Sinhalese:
                return ISO_639_2_Codes.sin.rawValue
            case .Filipino:
                return ISO_639_2_Codes.fil.rawValue
            case .Philipino:
                return ISO_639_2_Codes.fil.rawValue
            case .Mirandese:
                return ISO_639_2_Codes.mwl.rawValue
            case .Sicilian:
                return ISO_639_2_Codes.scn.rawValue
            case .ClassicalNewari:
                return ISO_639_2_Codes.nwc.rawValue
            case .OldNewari:
                return ISO_639_2_Codes.nwc.rawValue
            case .ClassicalNepalBhasa:
                return ISO_639_2_Codes.nwc.rawValue
            case .Blin:
                return ISO_639_2_Codes.byn.rawValue
            case .Bilin:
                return ISO_639_2_Codes.byn.rawValue
            case .Lojban:
                return ISO_639_2_Codes.jbo.rawValue
            case .LowerSorbian:
                return ISO_639_2_Codes.dsb.rawValue
            case .UpperSorbian:
                return ISO_639_2_Codes.hsb.rawValue
            case .Kashubian:
                return ISO_639_2_Codes.csb.rawValue
            case .CrimeanTatar:
                return ISO_639_2_Codes.crh.rawValue
            case .CrimeanTurkish:
                return ISO_639_2_Codes.crh.rawValue
            case .Adyghe:
                return ISO_639_2_Codes.ady.rawValue
            case .Adygei:
                return ISO_639_2_Codes.ady.rawValue
            case .KarachayBalkar:
                return ISO_639_2_Codes.krc.rawValue
            case .Moksha:
                return ISO_639_2_Codes.mdf.rawValue
            case .Erzya:
                return ISO_639_2_Codes.myv.rawValue
            case .Udmurt:
                return ISO_639_2_Codes.udm.rawValue
            case .Dargwa:
                return ISO_639_2_Codes.dar.rawValue
            case .Ingush:
                return ISO_639_2_Codes.inh.rawValue
            case .Nogai:
                return ISO_639_2_Codes.nog.rawValue
            case .Haitian:
                return ISO_639_2_Codes.hat.rawValue
            case .HaitianCreole:
                return ISO_639_2_Codes.hat.rawValue
            case .Kabardian:
                return ISO_639_2_Codes.kbd.rawValue
            case .Aragonese:
                return ISO_639_2_Codes.arg.rawValue
            case .Limburgan:
                return ISO_639_2_Codes.lim.rawValue
            case .Limburger:
                return ISO_639_2_Codes.lim.rawValue
            case .Limburgish:
                return ISO_639_2_Codes.lim.rawValue
            case .Neapolitan:
                return ISO_639_2_Codes.nap.rawValue
            case .SouthernSami:
                return ISO_639_2_Codes.sma.rawValue
            case .LuleSami:
                return ISO_639_2_Codes.smj.rawValue
            case .InariSami:
                return ISO_639_2_Codes.smn.rawValue
            case .SkoltSami:
                return ISO_639_2_Codes.sms.rawValue
            case .Walloon:
                return ISO_639_2_Codes.wln.rawValue
            case .Ido:
                return ISO_639_2_Codes.ido.rawValue
            case .TupiLanguages:
                return ISO_639_2_Codes.tup.rawValue
            case .Javanese:
                return ISO_639_2_Codes.jav.rawValue
            case .SouthNdebele:
                return ISO_639_2_Codes.nbl.rawValue
            case .NorthNdebele:
                return ISO_639_2_Codes.nde.rawValue
            case .LowGerman:
                return ISO_639_2_Codes.nds.rawValue
            case .LowSaxon:
                return ISO_639_2_Codes.nds.rawValue
            case .Avestan:
                return ISO_639_2_Codes.ave.rawValue
            case .Bambara:
                return ISO_639_2_Codes.bam.rawValue
            case .Bosnian:
                return ISO_639_2_Codes.bos.rawValue
            case .Chamorro:
                return ISO_639_2_Codes.cha.rawValue
            case .Chechen:
                return ISO_639_2_Codes.che.rawValue
            case .ChurchSlavic:
                return ISO_639_2_Codes.chu.rawValue
            case .OldSlavic:
                return ISO_639_2_Codes.chu.rawValue
            case .OldBulgarian:
                return ISO_639_2_Codes.chu.rawValue
            case .Chuvash:
                return ISO_639_2_Codes.chv.rawValue
            case .Herero:
                return ISO_639_2_Codes.her.rawValue
            case .HiriMotu:
                return ISO_639_2_Codes.hmo.rawValue
            case .Kikuyu:
                return ISO_639_2_Codes.kik.rawValue
            case .Gikuyu:
                return ISO_639_2_Codes.kik.rawValue
            case .Komi:
                return ISO_639_2_Codes.kom.rawValue
            case .Kuanyama:
                return ISO_639_2_Codes.kua.rawValue
            case .Kwanyama:
                return ISO_639_2_Codes.kua.rawValue
            case .Marshallese:
                return ISO_639_2_Codes.mah.rawValue
            case .Manchu:
                return ISO_639_2_Codes.mnc.rawValue
            case .Navajo:
                return ISO_639_2_Codes.nav.rawValue
            case .Navaho:
                return ISO_639_2_Codes.nav.rawValue
            case .Ndonga:
                return ISO_639_2_Codes.ndo.rawValue
            case .NorwegianNynorsk:
                return ISO_639_2_Codes.nno.rawValue
            case .NorwegianBokmål:
                return ISO_639_2_Codes.nob.rawValue
            case .Chichewa:
                return ISO_639_2_Codes.nya.rawValue
            case .Chewa:
                return ISO_639_2_Codes.nya.rawValue
            case .Nyanja:
                return ISO_639_2_Codes.nya.rawValue
            case .Ossetian:
                return ISO_639_2_Codes.oss.rawValue
            case .Pali:
                return ISO_639_2_Codes.pli.rawValue
            case .SignLanguages:
                return ISO_639_2_Codes.sgn.rawValue
            case .NorthernSami:
                return ISO_639_2_Codes.sme.rawValue
            case .Sardinian:
                return ISO_639_2_Codes.srd.rawValue
            case .Tahitian:
                return ISO_639_2_Codes.tah.rawValue
            case .Akan:
                return ISO_639_2_Codes.aka.rawValue
            case .Avaric:
                return ISO_639_2_Codes.ava.rawValue
            case .Cree:
                return ISO_639_2_Codes.cre.rawValue
            case .Ewe:
                return ISO_639_2_Codes.ewe.rawValue
            case .Fuljah:
                return ISO_639_2_Codes.ful.rawValue
            case .Igbo:
                return ISO_639_2_Codes.ibo.rawValue
            case .Kanuri:
                return ISO_639_2_Codes.kau.rawValue
            case .Kongo:
                return ISO_639_2_Codes.kon.rawValue
            case .LubaKatanga:
                return ISO_639_2_Codes.lub.rawValue
            case .Ganda:
                return ISO_639_2_Codes.lug.rawValue
            case .Ojibwa:
                return ISO_639_2_Codes.oji.rawValue
            case .Venda:
                return ISO_639_2_Codes.ven.rawValue
            case .Cornish:
                return ISO_639_2_Codes.cor.rawValue
            case .Manx:
                return ISO_639_2_Codes.glv.rawValue
            case .Luxembourgish:
                return ISO_639_2_Codes.ltz.rawValue
            case .Letzeburgesch:
                return ISO_639_2_Codes.ltz.rawValue
            case .Hebrew:
                return ISO_639_2_Codes.heb.rawValue
            case .Inuktitut:
                return ISO_639_2_Codes.iku.rawValue
            case .Indonesian:
                return ISO_639_2_Codes.ind.rawValue
            case .Uighru:
                return ISO_639_2_Codes.uig.rawValue
            case .Uyghur:
                return ISO_639_2_Codes.uig.rawValue
            case .Yiddish:
                return ISO_639_2_Codes.yid.rawValue
            case .Zhuang:
                return ISO_639_2_Codes.zha.rawValue
            case .Chuang:
                return ISO_639_2_Codes.zha.rawValue
        }
    }
}
