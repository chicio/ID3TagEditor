//
//  ISO_639_2_Codes.swift
//  AudiobookTagger
//
//  Created by Nolaine Crusher on 3/5/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

/// the ISO-639-2 language codes
public enum ISO_639_2_Codes: String {
 
    /// Undefined
    case und = "und"
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
    
    public static var all: [ISO_639_2_Codes] { return [.und, .cnr, .zgh, .hmn, .bih, .him, .afa, .apa, .art, .bai, .bat, .ber, .bnt, .cai, .cau, .cel, .cpe, .cpf, .cpp, .crp, .cus, .dra, .fiu, .gem, .inc, .ine, .ira, .iro, .khi, .map, .mkh, .nai, .nic, .oto, .paa, .phi, .pra, .roa, .sai, .sal, .sem, .sit, .sla, .smi, .ssa, .tai, .tut, .wak, .mol, .kho, .oci, .pro, .wal, .srp, .scc, .hrv, .scr, .zxx, .gsw, .pus, .ast, .bej, .chp, .iii, .ile, .pam, .zbl, .mis, .arc, .syc, .bin, .car, .bad, .btk, .day, .ijo, .kar, .kro, .nah, .son, .srn, .znd, .kac, .khm, .arn, .rar, .roh, .kir, .zza, .div, .nqo, .krl, .frs, .fry, .anp, .frr, .rup, .ain, .glg, .alt, .xal, .mic, .nso, .sin, .fil, .mwl, .scn, .nwc,. tlh, .byn, .jbo, .dsb, .hsb, .csb, .crh, .ady, .krc, .mdf, .myv, .udm, .dar, .inh, .nog, .hat, .kbd, .arg, .lim, .nap, .sma, .smj, .smn, .sms, .wln, .ido, .tup, .jav, .jav, .jaw, .nbl, .nde, .nds, .ave, .bam, .bos, .cha, .che, .chu, .chv, .her, .hmo, .kik, .kom, .kua, .mah, .mnc, .nav, .ndo, .nno, .nob, .nya, .nya, .oss, .oss, .pli, .sgn, .sme, .srd, .tah, .aka, .ava, .cre, .div, .ewe, .ful, .ibo, .kau, .kon, .lub, .lug, .oji, .ven, .cor, .glv, .ltz, .heb, .iku, .ind, .uig, .yid, .zha]
    }
            
    public static var UndefinedLanguage: String {
        return self.und.rawValue
    }

    public static var MontenegrinLanguages: String {
        return self.cnr.rawValue
    }

    public static var StandardMoroccanTamazighLanguages: String {
        return self.zgh.rawValue
    }

    public static var Hmong: String {
        return self.hmn.rawValue
    }

    public static var Mong: String {
        return self.hmn.rawValue
    }

    public static var BihariLanguages: String {
        return self.bih.rawValue
    }

    public static var HimachaliLanguages: String {
        return self.him.rawValue
    }

    public static var WesternPahariLanguages: String {
        return self.him.rawValue
    }

    public static var AfroAsiaticLanguages: String {
        return self.afa.rawValue
    }

    public static var ApachiLanguages: String {
        return self.apa.rawValue
    }

    public static var ArtificialLanguages: String {
        return self.art.rawValue
    }

    public static var BamilekeLanguages: String {
        return self.bai.rawValue
    }

    public static var BalticLanguages: String {
        return self.bat.rawValue
    }

    public static var BerberLanguages: String {
        return self.ber.rawValue
    }

    public static var BantuLanguages: String {
        return self.bnt.rawValue
    }

    public static var CentralAmericanIndianLanguages: String {
        return self.cai.rawValue
    }

    public static var CaucasianLanguages: String {
        return self.cau.rawValue
    }

    public static var CelticLanguages: String {
        return self.cel.rawValue
    }

    public static var EnglishCreolesAndPidgins: String {
        return self.cpe.rawValue
    }

    public static var FrenchCreolesAndPidgins: String {
        return self.cpf.rawValue
    }

    public static var PortugeseCreolesAndPidgins: String {
        return self.cpp.rawValue
    }

    public static var CreolesAndPidgins: String {
        return self.crp.rawValue
    }

    public static var CushiticLanguages: String {
        return self.cus.rawValue
    }

    public static var DravidianLanguages: String {
        return self.dra.rawValue
    }

    public static var FinnoUgrianLanguages: String {
        return self.fiu.rawValue
    }

    public static var GermanicLanguages: String {
        return self.gem.rawValue
    }

    public static var IndicLanguages: String {
        return self.inc.rawValue
    }

    public static var IndoEuropeanLanguages: String {
        return self.ine.rawValue
    }

    public static var IranianLanguages: String {
        return self.ira.rawValue
    }

    public static var IroquoianLanguages: String {
        return self.iro.rawValue
    }

    public static var KhoisanLanguages: String {
        return self.khi.rawValue
    }

    public static var AustronesianLanguages: String {
        return self.map.rawValue
    }

    public static var MonKhmerLanguages: String {
        return self.mkh.rawValue
    }

    public static var NorthAmericanIndianLanguages: String {
        return self.nai.rawValue
    }

    public static var NigerKordofanianLanguages: String {
        return self.nic.rawValue
    }

    public static var OtomianLanguages: String {
        return self.oto.rawValue
    }

    public static var PapuanLanguages: String {
        return self.paa.rawValue
    }

    public static var PhilippineLanguages: String {
        return self.phi.rawValue
    }

    public static var PrakritLanguages: String {
        return self.pra.rawValue
    }

    public static var RomanceLanguages: String {
        return self.roa.rawValue
    }

    public static var SouthAmericanIndianLanguages: String {
        return self.sai.rawValue
    }

    public static var SalishanLanguages: String {
        return self.sal.rawValue
    }

    public static var SemiticLanguages: String {
        return self.sem.rawValue
    }

    public static var SinoTibetanLanguages: String {
        return self.sit.rawValue
    }

    public static var SlavicLanguages: String {
        return self.sla.rawValue
    }

    public static var SamiLanguages: String {
        return self.smi.rawValue
    }

    public static var NiloSaharanLanguages: String {
        return self.ssa.rawValue
    }

    public static var TaiLanguages: String {
        return self.tai.rawValue
    }

    public static var AltaicLanguages: String {
        return self.tut.rawValue
    }

    public static var WakashanLanguages: String {
        return self.wak.rawValue
    }

    public static var Moldavian: String {
        return self.mol.rawValue
    }

    public static var Moldavan: String {
        return self.mol.rawValue
    }

    public static var Khotanese: String {
        return self.kho.rawValue
    }

    public static var Sakan: String {
        return self.kho.rawValue
    }

    public static var Occitan: String {
        return self.oci.rawValue
    }

    public static var Provençal: String {
        return self.pro.rawValue
    }

    public static var Wolaitta: String {
        return self.wal.rawValue
    }
        
    public static var Wolaytta: String {
        return self.wal.rawValue
    }

    public static var Serbian: String {
        return self.srp.rawValue
    }
    
    public static var Croatian: String {
        return self.hrv.rawValue
    }

    public static var NoLinguisticContent: String {
        return self.zxx.rawValue
    }
    
    public static var SwissGerman: String {
        return self.gsw.rawValue
    }

    public static var Alemannic: String {
        return self.gsw.rawValue
    }

    public static var Alsatian: String {
        return self.gsw.rawValue
    }

    public static var Pushto: String {
        return self.pus.rawValue
    }

    
    public static var Pashto: String {
        return self.pus.rawValue
    }

    public static var Asturian: String {
        return self.ast.rawValue
    }

    public static var Bable: String {
        return self.ast.rawValue
    }

    public static var Leonese: String {
        return self.ast.rawValue
    }

    public static var Asturleonese: String {
        return self.ast.rawValue
    }

    public static var Beja: String {
        return self.bej.rawValue
    }

    public static var Bedawiyet: String {
        return self.bej.rawValue
    }

    public static var Chipewyan: String {
        return self.chp.rawValue
    }

    public static var DeneSuline: String {
        return self.chp.rawValue
    }

    public static var SichuanYi: String {
        return self.iii.rawValue
    }

    public static var Nuosu: String {
        return self.iii.rawValue
    }

    public static var Interlingue: String {
        return self.ile.rawValue
    }

    public static var Occidental: String {
        return self.ile.rawValue
    }

    public static var Pampanga: String {
        return self.pam.rawValue
    }

    public static var Kapampangan: String {
        return self.pam.rawValue
    }

    public static var Blissymbols: String {
        return self.zbl.rawValue
    }

    public static var Blissymbolics: String {
        return self.zbl.rawValue
    }
    
    public static var Bliss: String {
        return self.zbl.rawValue
    }

    public static var UncodedLanguages: String {
        return self.mis.rawValue
    }

    /// Official Aramaic (700-300 BCE); Imperial Aramaic (700-300 BCE)
    public static var ImperialAramaic: String {
        return self.arc.rawValue
    }

    public static var ClassicalSyriac: String {
        return self.syc.rawValue
    }

    public static var Bini: String {
        return self.bin.rawValue
    }

    public static var Edo: String {
        return self.bin.rawValue
    }

    public static var GalibiCarib: String {
        return self.car.rawValue
    }

    public static var BandaLanguages: String {
        return self.bad.rawValue
    }

    public static var BatakLanguages: String {
        return self.btk.rawValue
    }

    public static var LandDayakLanguages: String {
        return self.day.rawValue
    }

    public static var IjoLanguages: String {
        return self.ijo.rawValue
    }

    public static var KarenLanguages: String {
        return self.kar.rawValue
    }

    public static var KruLanguages: String {
        return self.kro.rawValue
    }

    public static var NahuatlLanguages: String {
        return self.nah.rawValue
    }

    public static var SonghaiLanguages: String {
        return self.son.rawValue
    }

    public static var StananTongo: String {
        return self.srn.rawValue
    }

    public static var ZandeLanguages: String {
        return self.znd.rawValue
    }

    public static var Kachin: String {
        return self.kac.rawValue
    }

    public static var Jingpho: String {
        return self.kac.rawValue
    }

    public static var CentralKhmer: String {
        return self.khm.rawValue
    }

    public static var Mapudungun: String {
        return self.arn.rawValue
    }

    public static var Mapuche: String {
        return self.arn.rawValue
    }

    public static var Rarotongan: String {
        return self.rar.rawValue
    }

    public static var CookIslandsMaori: String {
        return self.rar.rawValue
    }

    public static var Romansh: String {
        return self.roh.rawValue
    }

    public static var Kirghiz: String {
        return self.kir.rawValue
    }

    public static var Kyrgyz: String {
        return self.kir.rawValue
    }

    public static var Zaza: String {
        return self.zza.rawValue
    }

    public static var Dimili: String {
        return self.zza.rawValue
    }

    public static var Dimli: String {
        return self.zza.rawValue
    }

    public static var Kirdki: String {
        return self.zza.rawValue
    }

    public static var Kirmanjki: String {
        return self.zza.rawValue
    }

    public static var Zazaki: String {
        return self.zza.rawValue
    }

    public static var Divehi: String {
        return self.div.rawValue
    }
    
    public static var Dhivehi: String {
        return self.div.rawValue
    }

    public static var Maldivian: String {
        return self.div.rawValue
    }
    /// N'Ko
    public static var NKo: String {
        return self.nqo.rawValue
    }

    public static var Karelian: String {
        return self.krl.rawValue
    }

    public static var EasternFrisian: String {
        return self.frs.rawValue
    }

    public static var WesternFrisian: String {
        return self.fry.rawValue
    }

    public static var Angika: String {
        return self.anp.rawValue
    }

    public static var NorthernFrisian: String {
        return self.frr.rawValue
    }

    public static var Aromanian: String {
        return self.rup.rawValue
    }

    public static var Arumanian: String {
        return self.rup.rawValue
    }

    public static var MacedoRomanian: String {
        return self.rup.rawValue
    }

    public static var Ainu: String {
        return self.ain.rawValue
    }

    public static var Galician: String {
        return self.glg.rawValue
    }
    
    public static var SouthernAltai: String {
        return self.alt.rawValue
    }

    public static var Kalmyk: String {
        return self.xal.rawValue
    }

    public static var Oirat: String {
        return self.xal.rawValue
    }
    /// Mi'kmaq
    public static var Mikmaq: String {
        return self.mic.rawValue
    }

    public static var Micmac: String {
        return self.mic.rawValue
    }

    public static var Pedi: String {
        return self.nso.rawValue
    }

    public static var Sepedi: String {
        return self.nso.rawValue
    }
    
    public static var NorthernSotho: String {
        return self.nso.rawValue
    }

    public static var Sinhala: String {
        return self.sin.rawValue
    }

    public static var Sinhalese: String {
        return self.sin.rawValue
    }

    public static var Filipino: String {
        return self.fil.rawValue
    }

    public static var Philipino: String {
        return self.fil.rawValue
    }

    public static var Mirandese: String {
        return self.mwl.rawValue
    }

    public static var Sicilian: String {
        return self.scn.rawValue
    }

    public static var ClassicalNewari: String {
        return self.nwc.rawValue
    }

    public static var OldNewari: String {
        return self.nwc.rawValue
    }
    
    public static var ClassicalNepalBhasa: String {
        return self.nwc.rawValue
    }

    public static var Blin: String {
        return self.byn.rawValue
    }

    public static var Bilin: String {
        return self.byn.rawValue
    }

    public static var Lojban: String {
        return self.jbo.rawValue
    }

    public static var LowerSorbian: String {
        return self.dsb.rawValue
    }

    public static var UpperSorbian: String {
        return self.hsb.rawValue
    }

    public static var Kashubian: String {
        return self.csb.rawValue
    }

    public static var CrimeanTatar: String {
        return self.crh.rawValue
    }

    public static var CrimeanTurkish: String {
        return self.crh.rawValue
    }

    public static var Adyghe: String {
        return self.ady.rawValue
    }

    public static var Adygei: String {
        return self.ady.rawValue
    }

    public static var KarachayBalkar: String {
        return self.krc.rawValue
    }

    public static var Moksha: String {
        return self.mdf.rawValue
    }

    public static var Erzya: String {
        return self.myv.rawValue
    }

    public static var Udmurt: String {
        return self.udm.rawValue
    }

    public static var Dargwa: String {
        return self.dar.rawValue
    }

    public static var Ingush: String {
        return self.inh.rawValue
    }

    public static var Nogai: String {
        return self.nog.rawValue
    }

    public static var Haitian: String {
        return self.hat.rawValue
    }

    public static var HaitianCreole: String {
        return self.hat.rawValue
    }

    public static var Kabardian: String {
        return self.kbd.rawValue
    }

    public static var Aragonese: String {
        return self.arg.rawValue
    }

    public static var Limbugan: String {
        return self.lim.rawValue
    }

    public static var Neapolitan: String {
        return self.nap.rawValue
    }

    public static var SouthernSami: String {
        return self.sma.rawValue
    }

    public static var LuleSami: String {
        return self.smj.rawValue
    }

    public static var InariSami: String {
        return self.smn.rawValue
    }

    public static var SkoltSami: String {
        return self.sms.rawValue
    }

    public static var Walloon: String {
        return self.wln.rawValue
    }

    public static var Ido: String {
        return self.ido.rawValue
    }

    public static var TupiLanguages: String {
        return self.tup.rawValue
    }

    public static var Javanese: String {
        return self.jav.rawValue
    }

    public static var SouthNdebele: String {
        return self.nbl.rawValue
    }

    public static var NorthNdebele: String {
        return self.nde.rawValue
    }

    public static var LowGerman: String {
        return self.nds.rawValue
    }

    public static var LowSaxon: String {
        return self.nds.rawValue
    }

    public static var Avestan: String {
        return self.ave.rawValue
    }

    public static var Bambara: String {
        return self.bam.rawValue
    }

    public static var Bosnian: String {
        return self.bos.rawValue
    }

    public static var Chamorro: String {
        return self.cha.rawValue
    }

    public static var Chechen: String {
        return self.che.rawValue
    }

    public static var ChurchSlavic: String {
        return self.chu.rawValue
    }

    public static var OldSlavonic: String {
        return self.chu.rawValue
    }

    public static var OldBulgarian: String {
        return self.chu.rawValue
    }

    public static var Chuvash: String {
        return self.chv.rawValue
    }

    public static var Herero: String {
        return self.her.rawValue
    }

    public static var HiriMotu: String {
        return self.hmo.rawValue
    }

    public static var Kikuyu: String {
        return self.kik.rawValue
    }

    public static var Gikuyu: String {
        return self.kik.rawValue
    }

    public static var Komi: String {
        return self.kom.rawValue
    }

    public static var Kuanyama: String {
        return self.kua.rawValue
    }

    public static var Kwanyama: String {
        return self.kua.rawValue
    }

    public static var Marshallese: String {
        return self.mah.rawValue
    }

    public static var Manchu: String {
        return self.mnc.rawValue
    }

    public static var Navajo: String {
        return self.nav.rawValue
    }

    public static var Navaho: String {
        return self.nav.rawValue
    }

    public static var Ndonga: String {
        return self.ndo.rawValue
    }

    public static var NorwegianNyorsk: String {
        return self.nno.rawValue
    }

    public static var NorwegianBokmål: String {
        return self.nob.rawValue
    }

    public static var Chichewa: String {
        return self.nya.rawValue
    }

    public static var Chewa: String {
        return self.nya.rawValue
    }

    public static var Nyanja: String {
        return self.nya.rawValue
    }

    public static var Ossetian: String {
        return self.oss.rawValue
    }

    public static var Pali: String {
        return self.pli.rawValue
    }

    public static var SignLanguage: String {
        return self.sgn.rawValue
    }

    public static var NorthernSami: String {
        return self.sme.rawValue
    }

    public static var Sardinian: String {
        return self.srd.rawValue
    }

    public static var Tahitian: String {
        return self.tah.rawValue
    }

    public static var Akan: String {
        return self.aka.rawValue
    }

    public static var Avaric: String {
        return self.ava.rawValue
    }

    public static var Cree: String {
        return self.cre.rawValue
    }

    public static var Ewe: String {
        return self.ewe.rawValue
    }

    public static var Fulah: String {
        return self.ful.rawValue
    }

    public static var Igbo: String {
        return self.ibo.rawValue
    }

    public static var Kanuri: String {
        return self.kau.rawValue
    }

    public static var Kongo: String {
        return self.kon.rawValue
    }

    public static var LubaKatanga: String {
        return self.lub.rawValue
    }

    public static var Ganda: String {
        return self.lug.rawValue
    }

    public static var Ojibwa: String {
        return self.oji.rawValue
    }

    public static var Venda: String {
        return self.ven.rawValue
    }

    public static var Cornish: String {
        return self.cor.rawValue
    }

    public static var Manx: String {
        return self.glv.rawValue
    }

    public static var Luxembourghish: String {
        return self.ltz.rawValue
    }

    public static var Letzeburgesch: String {
        return self.ltz.rawValue
    }

    public static var Hebrew: String {
        return self.heb.rawValue
    }

    public static var Inuktitut: String {
        return self.iku.rawValue
    }

    public static var Indonesian: String {
        return self.ind.rawValue
    }

    public static var Uighur: String {
        return self.uig.rawValue
    }

    public static var Uyghur: String {
        return self.uig.rawValue
    }

    public static var Yiddish: String {
        return self.yid.rawValue
    }

    public static var Zhuang: String {
        return self.zha.rawValue
    }

    public static var Chuang: String {
        return self.zha.rawValue
    }

    
}

