//
//  LanguageCodes.swift
//  AudiobookTagger
//
//  Created by Nolaine Crusher on 3/5/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

/// the ISO-639-2 language codes
public enum ISO_639_2_Codes: String {
    
    /// Montenegrin
    case cnr = "cnr"
    /// Standard Moroccan Tamazight
    case zgh = "zgh"
    /// Hmong; Mong
    case hmn = "hmn"
    /// Bihari languages
    case bih = "bih"
    /// Himachali languages; Western Pahari languages
    case him = "him"
    /// Afro-Asiatic languages
    case afa = "afa"
    /// Apache languages
    case apa = "apa"
    /// Artificial languages
    case art = "art"
    /// Bamileke languages
    case bai = "bai"
    /// Baltic languages
    case bat = "bat"
    ///Berber languages
    case ber = "ber"
    /// Bantu languages
    case bnt = "bnt"
    /// Central American Indian languages
    case cai = "cai"
    /// Caucasian languages
    case cau = "cau"
    /// Celtic languages
    case cel = "cel"
    /// Creoles and pidgins, English based
    case cpe = "cpe"
    /// Creoles and pidgins, French-based
    case cpf = "cpf"
    /// Creoles and pidgins, Portuguese-based
    case cpp = "cpp"
    /// Creoles and pidgins
    case crp = "crp"
    /// Cushitic languages
    case cus = "cus"
    /// Dravidian languages
    case dra = "dra"
    /// Finno-Ugrian languages
    case fiu = "fiu"
    /// Germanic languages
    case gem = "gem"
    /// Indic languages
    case inc = "inc"
    /// Indo-European languages
    case ine = "ine"
    /// Iranian languages
    case ira = "ira"
    /// Iroquoian languages
    case iro = "iro"
    /// Khoisan languages
    case khi = "khi"
    /// Austronesian languages
    case map = "map"
    /// Mon-Khmer languages
    case mkh = "mkh"
    /// North American Indian languages
    case nai = "nai"
    /// Niger-Kordofanian languages
    case nic = "nic"
    /// Otomian languages
    case oto = "oto"
    /// Papuan languages
    case paa = "paa"
    /// Philippine languages
    case phi = "phi"
    /// Prakrit languages
    case pra = "pra"
    /// Romance languages
    case roa = "roa"
    /// South American Indian languages
    case sai = "sai"
    /// Salishan languages
    case sal = "sal"
    /// Semitic languages
    case sem = "sem"
    /// Sino-Tibetan languages
    case sit = "sit"
    /// Slavic languages
    case sla = "sla"
    /// Sami languages
    case smi = "smi"
    /// Nilo-Saharan languages
    case ssa = "ssa"
    /// Tai languages
    case tai = "tai"
    /// Altaic languages
    case tut = "tut"
    /// Wakashan languages
    case wak = "wak"
    /// Moldavian; Moldovan
    case mol = "mol"
    /// Khotanese; Sakan
    case kho = "kho"
    /// Occitan (post 1500)
    case oci = "oci"
    /// Provençal, Old (to 1500);Occitan, Old (to 1500)
    case pro = "pro"
    /// Wolaitta; Wolaytta
    case wal = "wal"
    /// Serbian
    case srp = "srp"
    /// Serbian
    case scr = "scr"
    /// Croatian
    case hrv = "hrv"
    /// Croatian
    case scc = "scc"
    /// No linguistic content; Not applicable
    case zxx = "zxx"
    /// Swiss German; Alemannic; Alsatian
    case gsw = "gsw"
    /// Pushto; Pashto
    case pus = "pus"
    /// Asturian; Bable; Leonese; Asturleonese
    case ast = "ast"
    /// Beja; Bedawiyet
    case bej = "bej"
    /// Chipewyan; Dene Suline
    case chp = "chp"
    /// Sichuan Yi; Nuosu
    case iii = "iii"
    /// Interlingue; Occidental
    case ile = "ile"
    /// Pampanga; Kapampangan
    case pam = "pam"
    /// Blissymbols; Blissymbolics; Bliss"
    case zbl = "zbl"
    /// Uncoded languages
    case mis = "mis"
    /// Official Aramaic (700-300 BCE); Imperial Aramaic (700-300 BCE)
    case arc = "arc"
    /// Classical Syriac
    case syc = "syc"
    /// Bini; Edo
    case bin = "bin"
    /// Galibi Carib
    case car = "car"
    /// Banda languages
    case bad = "bad"
    /// Batak languages
    case btk = "btk"
    /// Land Dayak languages
    case day = "day"
    /// Ijo languages
    case ijo = "ijo"
    /// Karen languages
    case kar = "kar"
    /// Kru languages
    case kro = "kro"
    /// Nahuatl languages
    case nah = "nah"
    /// Songhai languages
    case son = "son"
    /// Sranan Tongo
    case srn = "srm"
    /// Zande languages
    case znd = "znd"
    /// Kachin; Jingpho
    case kac = "kac"
    /// Central Khmer
    case khm = "khm"
    /// Mapudungun; Mapuche
    case arn = "arn"
    /// Rarotongan; Cook Islands Maori
    case rar = "rar"
    /// Romansh
    case roh = "roh"
    /// Kirghiz; Kyrgyz
    case kir = "kir"
    /// Zaza; Dimili; Dimli; Kirdki; Kirmanjki; Zazaki
    case zza = "zza"
    /// Divehi; Dhivehi; Maldivian
    case div = "div"
    /// N'Ko
    case nqo = "nqo"
    /// Karelian
    case krl = "krl"
    /// Eastern Frisian
    case frs = "frs"
    /// Western Frisian
    case fry = "fry"
    /// Angika
    case anp = "anp"
    /// Northern Frisian
    case frr = "frr"
    /// Aromanian; Arumanian; Macedo-Romanian
    case rup = "rup"
    /// Ainu
    case ain = "ain"
    /// Galician
    case glg = "glg"
    /// Southern Altai
    case alt = "alt"
    /// Kalmyk; Oirat
    case xal = "xal"
    /// Mi'kmaq; Micmac
    case mic = ""
    /// Pedi; Sepedi; Northern Sotho
    case nso = "mic"
    /// Sinhala; Sinhalese
    case sin = "sin"
    /// Filipino; Pilipino
    case fil = "fil"
    /// Mirandese
    case mwl = "mwl"
    /// Sicilian
    case scn = "scn"
    /// Classical Newari; Old Newari; Classical Nepal Bhasa
    case nwc = "nwc"
    /// Klingon; tlhIngan-Hol
    case tlh = "tlh"
    /// Blin; Bilin
    case byn = "byn"
    /// Lojban
    case jbo = "jbo"
    /// Lower Sorbian
    case dsb = "dsb"
    /// Upper Sorbian
    case hsb = "hsb"
    /// Kashubian
    case csb = "csb"
    /// Crimean Tatar; Crimean Turkish
    case crh = "crh"
    /// Adyghe; Adygei
    case ady = "ady"
    /// Karachay-Balkar
    case krc = "krc"
    /// Moksha
    case mdf = "mdf"
    /// Erzya
    case myv = "myv"
    /// Udmurt
    case udm = "udm"
    /// Dargwa
    case dar = "dar"
    /// Ingush
    case inh = "inh"
    /// Nogai
    case nog = "nog"
    /// Haitian; Haitian Creole
    case hat = "hat"
    /// Kabardian
    case kbd = "kbd"
    /// Aragonese
    case arg = "arg"
    /// Limburgan; Limburger; Limburgish
    case lim = "lim"
    /// Neapolitan
    case nap = "nap"
    /// Southern Sami
    case sma = "sma"
    /// Lule Sami
    case smj = "smj"
    /// Inari Sami
    case smn = "smn"
    /// Skolt Sami
    case sms = "sms"
    /// Walloon
    case wln = "wln"
    /// Ido
    case ido = "ido"
    /// Tupi languages
    case tup = "tup"
    /// Javanese
    case jav = "jav"
    /// Javanese
    case jaw = "jaw"
    /// Ndebele, South; South Ndebele
    case nbl = "nbl"
    /// Ndebele, North; North Ndebele
    case nde = "nde"
    /// Low German; Low Saxon; German, Low; Saxon, Low
    case nds = "nds"
    /// Avestan
    case ave = "ave"
    /// Bambara
    case bam = "bam"
    /// Bosnian
    case bos = "bos"
    /// Chamorro
    case cha = "cha"
    /// Chechen
    case che = "che"
    /// Church Slavic; Old Slavonic; Church Slavonic; Old Bulgarian; Old Church Slavonic
    case chu = "chu"
    /// Chuvash
    case chv = "chv"
    /// Herero
    case her = "her"
    /// Hiri Motu
    case hmo = "hmo"
    /// Kikuyu; Gikuyu
    case kik = "kik"
    /// Komi
    case kom = "kom"
    /// Kuanyama; Kwanyama
    case kua = "kua"
    /// Marshallese
    case mah = "mah"
    /// Manchu
    case mnc = "mnc"
    /// Navajo; Navaho
    case nav = "nav"
    /// Ndonga
    case ndo = "ndo"
    /// Norwegian Nynorsk; Nynorsk, Norwegian
    case nno = "nno"
    /// Bokmål, Norwegian; Norwegian Bokmål
    case nob = "nob"
    /// Chichewa; Chewa; Nyanja
    case nya = "nya"
    /// Ossetian; Ossetic
    case oss = "oss"
    /// Pali
    case pli = "pli"
    /// Sign Languages
    case sgn = "sgn"
    /// Northern Sami
    case sme = "sme"
    /// Sardinian
    case srd = "srd"
    /// Tahitian
    case tah = "tah"
    /// Akan
    case aka = "aka"
    /// Avaric
    case ava = "ava"
    /// Cree
    case cre = "cre"
    /// Ewe
    case ewe = "ewe"
    /// Fulah
    case ful = "ful"
    /// Igbo
    case ibo = "ibo"
    /// Kanuri
    case kau = "kau"
    /// Kongo
    case kon = "kon"
    /// Luba-Katanga
    case lub = "lub"
    /// Ganda
    case lug = "lug"
    /// Ojibwa
    case oji = "oji"
    /// Venda
    case ven = "ven"
    /// Cornish
    case cor = "cor"
    /// Manx
    case glv = "glv"
    /// Luxembourgish; Letzeburgesch
    case ltz = "ltz"
    /// Hebrew
    case heb = "heb"
    /// Inuktitut
    case iku = "iku"
    /// Indonesian
    case ind = "ind"
    /// Uighur; Uyghur
    case uig = "uig"
    /// Yiddish
    case yid = "yid"
    /// Zhuang; Chuang
    case zha = "zha"
    
}

extension  ISO_639_2_Codes {
    
    public static var all: [ISO_639_2_Codes] { return [.cnr, .zgh, .hmn, .bih, .him, .afa, .apa, .art, .bai, .bat, .ber, .bnt, .cai, .cau, .cel, .cpe, .cpf, .cpp, .crp, .cus, .dra, .fiu, .gem, .inc, .ine, .ira, .iro, .khi, .map, .mkh, .nai, .nic, .oto, .paa, .phi, .pra, .roa, .sai, .sal, .sem, .sit, .sla, .smi, .ssa, .tai, .tut, .wak, .mol, .kho, .oci, .pro, .wal, .srp, .scc, .hrv, .scr, .zxx, .gsw, .pus, .ast, .bej, .chp, .iii, .ile, .pam, .zbl, .mis, .arc, .syc, .bin, .car, .bad, .btk, .day, .ijo, .kar, .kro, .nah, .son, .srn, .znd, .kac, .khm, .arn, .rar, .roh, .kir, .zza, .div, .nqo, .krl, .frs, .fry, .anp, .frr, .rup, .ain, .glg, .alt, .xal, .mic, .nso, .sin, .fil, .mwl, .scn, .nwc,. tlh, .byn, .jbo, .dsb, .hsb, .csb, .crh, .ady, .krc, .mdf, .myv, .udm, .dar, .inh, .nog, .hat, .kbd, .arg, .lim, .nap, .sma, .smj, .smn, .sms, .wln, .ido, .tup, .jav, .jav, .jaw, .nbl, .nde, .nds, .ave, .bam, .bos, .cha, .che, .chu, .chv, .her, .hmo, .kik, .kom, .kua, .mah, .mnc, .nav, .ndo, .nno, .nob, .nya, .nya, .oss, .oss, .pli, .sgn, .sme, .srd, .tah, .aka, .ava, .cre, .div, .ewe, .ful, .ibo, .kau, .kon, .lub, .lug, .oji, .ven, .cor, .glv, .ltz, .heb, .iku, .ind, .uig, .yid, .zha]
    }
    
    public var language: String {
        switch self {
            case .cnr: return "Montenegrin"
            case .zgh: return "Standard Moroccan Tamazight"
            case .hmn: return "Hmong; Mong"
            case .bih: return "Bihari languages"
            case .him: return "Himachali languages; Western Pahari languages"
            case .afa: return "Afro-Asiatic languages"
            case .apa: return "Apache languages"
            case .art: return "Artificial languages"
            case .bai: return "Bamileke languages"
            case .bat: return "Baltic languages"
            case .ber: return "Berber languages"
            case .bnt: return "Bantu languages"
            case .cai: return "Central American Indian languages"
            case .cau: return "Caucasian languages"
            case .cel: return "Celtic languages"
            case .cpe: return "Creoles and pidgins, English based"
            case .cpf: return "Creoles and pidgins, French-based"
            case .cpp: return "Creoles and pidgins, Portuguese-based"
            case .crp: return "Creoles and pidgins"
            case .cus: return "Cushitic languages"
            case .dra: return "Dravidian languages"
            case .fiu: return "Finno-Ugrian languages"
            case .gem: return "Germanic languages"
            case .inc: return "Indic languages"
            case .ine: return "Indo-European languages"
            case .ira: return "Iranian languages"
            case .iro: return "Iroquoian languages"
            case .khi: return "Khoisan languages"
            case .map: return "Austronesian languages"
            case .mkh: return "Mon-Khmer languages"
            case .nai: return "North American Indian languages"
            case .nic: return "Niger-Kordofanian languages"
            case .oto: return "Otomian languages"
            case .paa: return "Papuan languages"
            case .phi: return "Philippine languages"
            case .pra: return "Prakrit languages"
            case .roa: return "Romance languages"
            case .sai: return "South American Indian languages"
            case .sal: return "Salishan languages"
            case .sem: return "Semitic languages"
            case .sit: return "Sino-Tibetan languages"
            case .sla: return "Slavic languages"
            case .smi: return "Sami languages"
            case .ssa: return "Nilo-Saharan languages"
            case .tai: return "Tai languages"
            case .tut: return "Altaic languages"
            case .wak: return "Wakashan languages"
            case .mol: return "Moldavian; Moldovan"
            case .kho: return "Khotanese; Sakan"
            case .oci: return "Occitan (post 1500)"
            case .pro: return "Provençal, Old (to 1500);Occitan, Old (to 1500)"
            case .wal: return "Wolaitta; Wolaytta"
            case .srp: return "Serbian"
            case .scc: return "Serbian"
            case .hrv: return "Croatian"
            case .scr: return "Croatian"
            case .zxx: return "No linguistic content; Not applicable"
            case .gsw: return "Swiss German; Alemannic; Alsatian"
            case .pus: return "Pushto; Pashto"
            case .ast: return "Asturian; Bable; Leonese; Asturleonese"
            case .bej: return "Beja; Bedawiyet"
            case .chp: return "Chipewyan; Dene Suline"
            case .iii: return "Sichuan Yi; Nuosu"
            case .ile: return "Interlingue; Occidental"
            case .pam: return "Pampanga; Kapampangan"
            case .zbl: return "Blissymbols; Blissymbolics; Bliss"
            case .mis: return "Uncoded languages"
            case .arc: return "Official Aramaic (700-300 BCE); Imperial Aramaic (700-300 BCE)"
            case .syc: return "Classical Syriac"
            case .bin: return "Bini; Edo"
            case .car: return "Galibi Carib"
            case .bad: return "Banda languages"
            case .btk: return "Batak languages"
            case .day: return "Land Dayak languages"
            case .ijo: return "Ijo languages"
            case .kar: return "Karen languages"
            case .kro: return "Kru languages"
            case .nah: return "Nahuatl languages"
            case .son: return "Songhai languages"
            case .srn: return "Sranan Tongo"
            case .znd: return "Zande languages"
            case .kac: return "Kachin; Jingpho"
            case .khm: return "Central Khmer"
            case .arn: return "Mapudungun; Mapuche"
            case .rar: return "Rarotongan; Cook Islands Maori"
            case .roh: return "Romansh"
            case .kir: return "Kirghiz; Kyrgyz"
            case .zza: return "Zaza; Dimili; Dimli; Kirdki; Kirmanjki; Zazaki"
            case .div: return "Divehi; Dhivehi; Maldivian"
            case .nqo: return "N'Ko"
            case .krl: return "Karelian"
            case .frs: return "Eastern Frisian"
            case .fry: return "Western Frisian"
            case .anp: return "Angika"
            case .frr: return "Northern Frisian"
            case .rup: return "Aromanian; Arumanian; Macedo-Romanian"
            case .ain: return "Ainu"
            case .glg: return "Galician"
            case .alt: return "Southern Altai"
            case .xal: return "Kalmyk; Oirat"
            case .mic: return "Mi'kmaq; Micmac"
            case .nso: return "Pedi; Sepedi; Northern Sotho"
            case .sin: return "Sinhala; Sinhalese"
            case .fil: return "Filipino; Pilipino"
            case .mwl: return "Mirandese"
            case .scn: return "Sicilian"
            case .nwc: return "Classical Newari; Old Newari; Classical Nepal Bhasa"
            case .tlh: return "Klingon; tlhIngan-Hol"
            case .byn: return "Blin; Bilin"
            case .jbo: return "Lojban"
            case .dsb: return "Lower Sorbian"
            case .hsb: return "Upper Sorbian"
            case .csb: return "Kashubian"
            case .crh: return "Crimean Tatar; Crimean Turkish"
            case .ady: return "Adyghe; Adygei"
            case .krc: return "Karachay-Balkar"
            case .mdf: return "Moksha"
            case .myv: return "Erzya"
            case .udm: return "Udmurt"
            case .dar: return "Dargwa"
            case .inh: return "Ingush"
            case .nog: return "Nogai"
            case .hat: return "Haitian; Haitian Creole"
            case .kbd: return "Kabardian"
            case .arg: return "Aragonese"
            case .lim: return "Limburgan; Limburger; Limburgish"
            case .nap: return "Neapolitan"
            case .sma: return "Southern Sami"
            case .smj: return "Lule Sami"
            case .smn: return "Inari Sami"
            case .sms: return "Skolt Sami"
            case .wln: return "Walloon"
            case .ido: return "Ido"
            case .tup: return "Tupi languages"
            case .jav: return "Javanese"
            case .jaw: return "Javanese"
            case .nbl: return "Ndebele, South; South Ndebele"
            case .nde: return "Ndebele, North; North Ndebele"
            case .nds: return "Low German; Low Saxon; German, Low; Saxon, Low"
            case .ave: return "Avestan"
            case .bam: return "Bambara"
            case .bos: return "Bosnian"
            case .cha: return "Chamorro"
            case .che: return "Chechen"
            case .chu: return "Church Slavic; Old Slavonic; Church Slavonic; Old Bulgarian; Old Church Slavonic"
            case .chv: return "Chuvash"
            case .her: return "Herero"
            case .hmo: return "Hiri Motu"
            case .kik: return "Kikuyu; Gikuyu"
            case .kom: return "Komi"
            case .kua: return "Kuanyama; Kwanyama"
            case .mah: return "Marshallese"
            case .mnc: return "Manchu"
            case .nav: return "Navajo; Navaho"
            case .ndo: return "Ndonga"
            case .nno: return "Norwegian Nynorsk; Nynorsk, Norwegian"
            case .nob: return "Bokmål, Norwegian; Norwegian Bokmål"
            case .nya: return "Chichewa; Chewa; Nyanja"
            case .oss: return "Ossetian; Ossetic"
            case .pli: return "Pali"
            case .sgn: return "Sign Languages"
            case .sme: return "Northern Sami"
            case .srd: return "Sardinian"
            case .tah: return "Tahitian"
            case .aka: return "Akan"
            case .ava: return "Avaric"
            case .cre: return "Cree"
            case .ewe: return "Ewe"
            case .ful: return "Fulah"
            case .ibo: return "Igbo"
            case .kau: return "Kanuri"
            case .kon: return "Kongo"
            case .lub: return "Luba-Katanga"
            case .lug: return "Ganda"
            case .oji: return "Ojibwa"
            case .ven: return "Venda"
            case .cor: return "Cornish"
            case .glv: return "Manx"
            case .ltz: return "Luxembourgish; Letzeburgesch"
            case .heb: return "Hebrew"
            case .iku: return "Inuktitut"
            case .ind: return "Indonesian"
            case .uig: return "Uighur; Uyghur"
            case .yid: return "Yiddish"
            case .zha: return "Zhuang; Chuang"
        }
    }
    
}

