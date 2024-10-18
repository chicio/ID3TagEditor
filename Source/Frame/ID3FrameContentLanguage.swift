//
//  ID3FrameContentLanguage.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 09.10.20.
//  2020 Fabrizio Duroni
//

import Foundation

// swiftlint:disable type_body_length
// swiftlint:disable file_length

/**
 List of language identifier used in frames that support localized content with language indication.
 The list of supported languages corresponds to the ISO-639-2 standard.
 Languages with multiple code are distinguished by "B" (bibliographic) or "T" (terminology).
 */
public enum ID3FrameContentLanguage: String, Equatable, Hashable, CaseIterable {
    /// Afar language.
    case aar
    /// Abkhazian language.
    case abk
    /// Achinese laguage.
    case ace
    /// Acoli language.
    case ach
    /// Adangme language.
    case ada
    /// Adyghe;-Adygei language.
    case ady
    /// Afro-Asiatic languages.
    case afa
    /// Afrihili language.
    case afh
    /// Afrikaans language.
    case afr
    /// Ainu language.
    case ain
    /// Akan language.
    case aka
    /// Akkadian language.
    case akk
    /// Albanian (B) language.
    case alb
    /// Albanian (T) language.
    case sqi
    /// Aleut language.
    case ale
    /// Algonquian languages.
    case alg
    /// Southern Altai language.
    case alt
    /// Amharic language.
    case amh
    /// Old English (ca.450-1100) language.
    case ang
    /// Angika language.
    case anp
    /// Apache languages.
    case apa
    /// Arabic language.
    case ara
    /// Official Aramaic (700-300 BCE) - Imperial Aramaic (700-300 BCE) language.
    case arc
    /// Aragonese language.
    case arg
    /// Armenian (B) language.
    case arm
    /// Armenian (T) language.
    case hye
    /// Mapudungun - Mapuche language.
    case arn
    /// Arapaho language.
    case arp
    /// Artificial languages.
    case art
    /// Arawak language.
    case arw
    /// Assamese language.
    case asm
    /// Asturian - Bable - Leonese - Asturleonese languages.
    case ast
    /// Athapascan languages.
    case ath
    /// Australian languages.
    case aus
    /// Avaric language.
    case ava
    /// Avestan language.
    case ave
    /// Awadhi language.
    case awa
    /// Aymara language.
    case aym
    /// Azerbaijani language.
    case aze
    /// Banda languages.
    case bad
    /// Bamileke languages.
    case bai
    /// Bashkir language.
    case bak
    /// Baluchi language.
    case bal
    /// Bambara language.
    case bam
    /// Balinese language.
    case ban
    /// Basque (B) language.
    case baq
    /// Basque (T) language.
    case eus
    /// Basa language.
    case bas
    /// Baltic languages.
    case bat
    /// Beja - Bedawiyet language.
    case bej
    /// Belarusian language.
    case bel
    /// Bemba language.
    case bem
    /// Bengali language.
    case ben
    /// Berber languages.
    case ber
    /// Bhojpuri language.
    case bho
    /// Bihari languages.
    case bih
    /// Bikol language.
    case bik
    /// Bini - Edo language.
    case bin
    /// Bislama language.
    case bis
    /// Siksika language.
    case bla
    /// Bantu languages.
    case bnt
    /// Tibetan (B) language.
    case tib
    /// Tibetan (T) language.
    case bod
    /// Bosnian language.
    case bos
    /// Braj language.
    case bra
    /// Breton language.
    case bre
    /// Batak languages.
    case btk
    /// Buriat language.
    case bua
    /// Buginese language.
    case bug
    /// Bulgarian language.
    case bul
    /// Burmese (B) language.
    case bur
    /// Burmese (T) language.
    case mya
    /// Blin - Bilin language.
    case byn
    /// Caddo language.
    case cad
    /// Central American Indian languages.
    case cai
    /// Galibi Carib language.
    case car
    /// Catalan - Valencian language.
    case cat
    /// Caucasian languages.
    case cau
    /// Cebuano language.
    case ceb
    /// Celtic languages.
    case cel
    /// Czech (B) language.
    case cze
    /// Czech (T) language.
    case ces
    /// Chamorro language.
    case cha
    /// Chibcha language.
    case chb
    /// Chechen language.
    case che
    /// Chagatai language.
    case chg
    /// Chinese (B) language.
    case chi
    /// Chinese (T) language.
    case zho
    /// Chuukese language.
    case chk
    /// Mari language.
    case chm
    /// Chinook jargon language.
    case chn
    /// Choctaw language.
    case cho
    /// Chipewyan - Dene Suline language.
    case chp
    /// Cherokee language.
    case chr
    /// Church Slavic - Old Slavonic - Church Slavonic - Old Bulgarian - Old Church Slavonic language.
    case chu
    /// Chuvash language.
    case chv
    /// Cheyenne language.
    case chy
    /// Chamic languages.
    case cmc
    /// Montenegrin language.
    case cnr
    /// Coptic language.
    case cop
    /// Cornish language.
    case cor
    /// Corsican language.
    case cos
    /// Creoles and pidgins, English based language.
    case cpe
    /// Creoles and pidgins, French-based language.
    case cpf
    /// Creoles and pidgins, Portuguese-based language.
    case cpp
    /// Cree language.
    case cre
    /// Crimean Tatar - Crimean Turkish language.
    case crh
    /// Creoles and pidgins language.
    case crp
    /// Kashubian language.
    case csb
    /// Cushitic languages.
    case cus
    /// Welsh (B) language.
    case wel
    /// Welsh (T) language.
    case cym
    /// Dakota language.
    case dak
    /// Danish language.
    case dan
    /// Dargwa language.
    case dar
    /// Land Dayak languages    .
    case day
    /// Delaware language.
    case del
    /// Slave (Athapascan) language.
    case den
    /// German (B) language.
    case ger
    /// German (T) language.
    case deu
    /// Dogrib language.
    case dgr
    /// Dinka language.
    case din
    /// Divehi - Dhivehi - Maldivian language.
    case div
    /// Dogri language.
    case doi
    /// Dravidian languages.
    case dra
    /// Lower Sorbian language.
    case dsb
    /// Duala language.
    case dua
    /// Dutch, Middle (ca.1050-1350) language.
    case dum
    /// Dutch - Flemish (B) language.
    case dut
    /// Dutch - Flemish (T) language.
    case nld
    /// Dyula language.
    case dyu
    /// Dzongkha language.
    case dzo
    /// Efik language.
    case efi
    /// Egyptian (Ancient) language.
    case egy
    /// Ekajuk language.
    case eka
    /// Greek, Modern (1453-)  (B) language.
    case gre
    /// Greek, Modern (1453-)  (T) language.
    case ell
    /// Elamite language.
    case elx
    /// English language.
    case eng
    /// English, Middle (1100-1500) language.
    case enm
    /// Esperanto language.
    case epo
    /// Estonian language.
    case est
    /// Ewe language.
    case ewe
    /// Ewondo language.
    case ewo
    /// Fang language.
    case fan
    /// Faroese language.
    case fao
    /// Persian (B) language.
    case per
    /// Persian (T) language.
    case fas
    /// Fanti language.
    case fat
    /// Fijian language.
    case fij
    /// Filipino language.
    case fil
    /// Finnish language.
    case fin
    /// Finno-Ugrian languages.
    case fiu
    /// Fon language.
    case fon
    /// French (B) language.
    case fre
    /// French (T) language.
    case fra
    /// French, Middle (ca.1400-1600) language.
    case frm
    /// French, Old (842-ca.1400) language.
    case fro
    /// Northern Frisian language.
    case frr
    /// Eastern Frisian language.
    case frs
    /// Western Frisian language.
    case fry
    /// Fulah language.
    case ful
    /// Friulian language.
    case fur
    /// Ga language.
    case gaa
    /// Gayo language.
    case gay
    /// Gbaya language.
    case gba
    /// Germanic languages.
    case gem
    /// Georgian (B) language.
    case geo
    /// Georgian (T) language.
    case kat
    /// Geez language.
    case gez
    /// Gilbertese language.
    case gil
    /// Gaelic - Scottish Gaelic language.
    case gla
    /// Irish language.
    case gle
    /// Galician language.
    case glg
    /// Manx language.
    case glv
    /// German, Middle High (ca.1050-1500) language.
    case gmh
    /// German, Old High (ca.750-1050) language.
    case goh
    /// Gondi language.
    case gon
    /// Gorontalo language.
    case gor
    /// Gothic language.
    case got
    /// Grebo language.
    case grb
    /// Greek, Ancient (to 1453) language.
    case grc
    /// Guarani language.
    case grn
    /// Swiss German - Alemannic - Alsatian language.
    case gsw
    /// Gujarati language.
    case guj
    /// Gwich'in language.
    case gwi
    /// Haida language.
    case hai
    /// Haitian - Haitian Creole language.
    case hat
    /// Hausa language.
    case hau
    /// Hawaiian language.
    case haw
    /// Hebrew language.
    case heb
    /// Herero language.
    case her
    /// Hiligaynon language.
    case hil
    /// Himachali - Western Pahari languages.
    case him
    /// Hindi language.
    case hin
    /// Hittite language.
    case hit
    /// Hmong - Mong language.
    case hmn
    /// Hiri Motu language.
    case hmo
    /// Croatian language.
    case hrv
    /// Upper Sorbian language.
    case hsb
    /// Hungarian language.
    case hun
    /// Hupa language.
    case hup
    /// Iban language.
    case iba
    /// Igbo language.
    case ibo
    /// Icelandic (B) language.
    case ice
    /// Icelandic (T) language.
    case isl
    /// Ido language.
    case ido
    /// Sichuan Yi - Nuosu language.
    case iii
    /// Ijo languages.
    case ijo
    /// Inuktitut language.
    case iku
    /// Interlingue - Occidental language.
    case ile
    /// Iloko language.
    case ilo
    /// Interlingua language.
    case ina
    /// Indic languages.
    case inc
    /// Indonesian language.
    case ind
    /// Indo-European languages.
    case ine
    /// Ingush language.
    case inh
    /// Inupiaq language.
    case ipk
    /// Iranian languages.
    case ira
    /// Iroquoian languages.
    case iro
    /// Italian language.
    case ita
    /// Javanese language.
    case jav
    /// Lojban language.
    case jbo
    /// Japanese language.
    case jpn
    /// Judeo-Persian language.
    case jpr
    /// Judeo-Arabic language.
    case jrb
    /// Kara-Kalpak language.
    case kaa
    /// Kabyle language.
    case kab
    /// Kachin - Jingpho language.
    case kac
    /// Kalaallisut - Greenlandic language.
    case kal
    /// Kamba language.
    case kam
    /// Kannada language.
    case kan
    /// Karen languages.
    case kar
    /// Kashmiri language.
    case kas
    /// Georgian language.
    case kau
    /// Kanuri language.
    case kaw
    /// Kazakh language.
    case kaz
    /// Kabardian language.
    case kbd
    /// Khasi language.
    case kha
    /// Khoisan languages.
    case khi
    /// Central Khmer language.
    case khm
    /// Khotanese - Sakan language.
    case kho
    /// Kikuyu - Gikuyu language.
    case kik
    /// Kinyarwanda language.
    case kin
    /// Kirghiz language.
    case kir
    /// Kimbundu language.
    case kmb
    /// Konkani language.
    case kok
    /// Komi language.
    case kom
    /// Kongo language.
    case kon
    /// Korean language.
    case kor
    /// Kosraean language.
    case kos
    /// Kpelle language.
    case kpe
    /// Karachay-Balkar language.
    case krc
    /// Karelian language.
    case krl
    /// Kru languages.
    case kro
    /// language.
    case kru
    /// language.
    case kua
    /// Kurukh language.
    case kum
    /// Kuanyama - Kwanyama language.
    case kur
    /// Kutenai language.
    case kut
    /// Ladino language.
    case lad
    /// Lahnda language.
    case lah
    /// Lamba language.
    case lam
    /// Lao language.
    case lao
    /// Latin language.
    case lat
    /// Latvian language.
    case lav
    /// Lezghian language.
    case lez
    /// Limburgan - Limburger - Limburgish language.
    case lim
    /// Lingala language.
    case lin
    /// Lithuanian language.
    case lit
    /// Mongo language.
    case lol
    /// Lozi language.
    case loz
    /// Luxembourgish language.
    case ltz
    /// Luba-Lulua language.
    case lua
    /// Luba-Katanga language.
    case lub
    /// Ganda language.
    case lug
    /// Luiseno language.
    case lui
    /// Lunda language.
    case lun
    /// Luo (Kenya and Tanzania) language.
    case luo
    /// Lushai language.
    case lus
    /// Macedonian (B) language.
    case mac
    /// Macedonian (T) language.
    case mkd
    /// Madurese language.
    case mad
    /// Magahi language.
    case mag
    /// Marshallese language.
    case mah
    /// Maithili language.
    case mai
    /// Makasar language.
    case mak
    /// Malayalam language.
    case mal
    /// Mandingo language.
    case man
    /// Maori (B) language.
    case mao
    /// Maori (T) language.
    case mri
    /// Austronesian languages.
    case map
    /// Marathi language.
    case mar
    /// Masai language.
    case mas
    /// Malay (B) language.
    case may
    /// Malay (T) language.
    case msa
    /// Moksha language.
    case mdf
    /// Mandar language.
    case mdr
    /// Mende language.
    case men
    /// Irish, Middle (900-1200) language.
    case mga
    /// Mi'kmaq language.
    case mic
    /// Minangkabau language.
    case min
    /// Uncoded languages.
    case mis
    /// Mon-Khmer languages.
    case mkh
    /// Malagasy language.
    case mlg
    /// Maltese language.
    case mlt
    /// Manchu language.
    case mnc
    /// Manipuri language.
    case mni
    /// Manobo languages.
    case mno
    /// Mohawk language.
    case moh
    /// Mongolian language.
    case mon
    /// Mossi language.
    case mos
    /// Multiple languages.
    case mul
    /// Munda languages.
    case mun
    /// Creek language.
    case mus
    /// Mirandese language.
    case mwl
    /// Marwari language.
    case mwr
    /// Burmese language.
    case myn
    /// Mayan languages.
    case myv
    /// Nahuatl languages.
    case nah
    /// North American Indian languages.
    case nai
    /// Neapolitan language.
    case nap
    /// Nauru language.
    case nau
    /// Navajo - Navaho language.
    case nav
    /// South Ndebele language.
    case nbl
    /// North Ndebele language.
    case nde
    /// Ndonga language.
    case ndo
    /// Low German; Low Saxon; German, Low; Saxon, Low language.
    case nds
    /// Nepali language.
    case nep
    /// Nepal Bhasa; Newari language.
    case new
    /// Nias language.
    case nia
    /// Niger-Kordofanian languages.
    case nic
    /// Niuean language.
    case niu
    /// Nynorsk, Norwegian language.
    case nno
    /// Bokmål, Norwegian language.
    case nob
    /// Nogai language.
    case nog
    /// Old Norse language.
    case non
    /// Norwegian language.
    case nor
    /// N'Ko language.
    case nqo
    /// Northern Sotho language.
    case nso
    /// Nubian languages.
    case nub
    /// Classical Nepal Bhasa.
    case nwc
    /// Chichewa; Chewa; Nyanja language.
    case nya
    /// Nyamwezi language.
    case nym
    /// Nyankole language.
    case nyn
    /// Nyoro language.
    case nyo
    /// Nzima language.
    case nzi
    /// Occitan (post 1500) language.
    case oci
    /// Ojibwa language.
    case oji
    /// Oriya language.
    case ori
    /// Oromo language.
    case orm
    /// Osage language.
    case osa
    /// Ossetian; Ossetic language.
    case oss
    /// Turkish, Ottoman (1500-1928) language.
    case ota
    /// Otomian languages.
    case oto
    /// Papuan languages.
    case paa
    /// Pangasinan language.
    case pag
    /// Pahlavi language.
    case pal
    /// Pampanga language.
    case pam
    /// Panjabi; Punjabi language.
    case pan
    /// Papiamento language.
    case pap
    /// Palauan language.
    case pau
    /// Persian, Old (ca.600-400 B.C.) language.
    case peo
    /// Philippine languages.
    case phi
    /// Phoenician language.
    case phn
    /// Pali language.
    case pli
    /// Polish language.
    case pol
    /// Pohnpeian language.
    case pon
    /// Portuguese language.
    case por
    /// Prakrit languages.
    case pra
    /// Provençal, Old (to 1500) - Occitan, Old (to 1500) language.
    case pro
    /// Pushto - Pashto language.
    case pus
    /// Reserved for local use language.
    case qaa
    /// Reserved for local use language.
    case qtz
    /// Quechua language.
    case que
    /// Rajasthani language.
    case raj
    /// Rapanui language.
    case rap
    /// Rarotongan- Cook Islands Maori language.
    case rar
    /// Romance language.
    case roa
    /// Romansh language.
    case roh
    /// Romany language.
    case rom
    /// Romanian/Moldavian/Moldovan (B) language.
    case rum
    /// Romanian/Moldavian/Moldovan (B) language.
    case ron
    /// Rundi language.
    case run
    /// Aromanian/Arumanian/Macedo-Romanian language.
    case rup
    /// Russian language.
    case rus
    /// Sandawe language.
    case sad
    /// Sango language.
    case sag
    /// Yakut language.
    case sah
    /// South American Indian languages.
    case sai
    /// Salishan languages.
    case sal
    /// Samaritan Aramaic.
    case sam
    /// Sanskrit language.
    case san
    /// Sasak language.
    case sas
    /// Santali language.
    case sat
    /// Sicilian language.
    case scn
    /// Scots language.
    case sco
    /// Selkup language.
    case sel
    /// Semitic languages.
    case sem
    /// Old Irish (to 900) language.
    case sga
    /// Sign Languages.
    case sgn
    /// Shan language.
    case shn
    /// Sidamo language.
    case sid
    /// Sinhala - Sinhalese language.
    case sin
    /// Siouan languages language.
    case sio
    /// Sino-Tibetan languages.
    case sit
    /// Slavic languages language.
    case sla
    /// Slovak (B) language.
    case slo
    /// Slovak (T) language.
    case slk
    /// Slovenian language.
    case slv
    /// Southern Sami language.
    case sma
    /// Northern Sami language.
    case sme
    /// Sami languages language.
    case smi
    /// Lule Sami language.
    case smj
    /// Inari Sami language.
    case smn
    /// Samoan language.
    case smo
    /// Skolt Sami language.
    case sms
    /// Shona language.
    case sna
    /// Sindhi language.
    case snd
    /// Soninke language.
    case snk
    /// Sogdian language.
    case sog
    /// Somali language.
    case som
    /// Songhai languages.
    case son
    /// Sotho, Southern language.
    case sot
    /// Spanish - Castilian language.
    case spa
    /// Sardinian language.
    case srd
    /// Sranan Tongo language.
    case srn
    /// Serbian language.
    case srp
    /// Serer language.
    case srr
    /// Nilo-Saharan languages.
    case ssa
    /// Swati language.
    case ssw
    /// Sukuma language.
    case suk
    /// Sundanese language.
    case sun
    /// Susu language.
    case sus
    /// Sumerian language.
    case sux
    /// Swahili language.
    case swa
    /// Swedish language.
    case swe
    /// Classical Syriac language.
    case syc
    /// Syriac language.
    case syr
    /// Tahitian language.
    case tah
    /// Tai languages.
    case tai
    /// Tamil language.
    case tam
    /// Tatar language.
    case tat
    /// Telugu language.
    case tel
    /// Timne language.
    case tem
    /// Tereno language.
    case ter
    /// Tetum language.
    case tet
    /// Tajik language.
    case tgk
    /// Tagalog language.
    case tgl
    /// Thai language.
    case tha
    /// Tigre language.
    case tig
    /// Tigrinya language.
    case tir
    /// Tiv language.
    case tiv
    /// Tokelau language.
    case tkl
    /// Klingon - tlhIngan-Hol language.
    case tlh
    /// Tlingit language.
    case tli
    /// Tamashek language.
    case tmh
    /// Tonga (Nyasa) language.
    case tog
    /// Tonga (Tonga Islands) language.
    case ton
    /// Tok Pisin language.
    case tpi
    /// Tsimshian language.
    case tsi
    /// Tswana language.
    case tsn
    /// Tsonga language.
    case tso
    /// Turkmen language.
    case tuk
    /// Tumbuka language.
    case tum
    /// Tupi languages.
    case tup
    /// Turkish language.
    case tur
    /// Altaic languages.
    case tut
    /// Tuvalu language.
    case tvl
    /// Twi language.
    case twi
    /// Tuvinian language.
    case tyv
    /// Udmurt language.
    case udm
    /// Ugaritic language.
    case uga
    /// Uighur - Uyghur language.
    case uig
    /// Ukrainian language.
    case ukr
    /// Umbundu language.
    case umb
    /// Undetermined language.
    case und
    /// Urdu language.
    case urd
    /// Uzbek language.
    case uzb
    /// Vai language.
    case vai
    /// Venda language.
    case ven
    /// Vietnamese language.
    case vie
    /// Volapük language.
    case vol
    /// Votic language.
    case vot
    /// Wakashan languages.
    case wak
    /// Wolaitta - Wolaytta language.
    case wal
    /// Waray language.
    case war
    /// Washo language.
    case was
    /// Sorbian languages.
    case wen
    /// Walloon language.
    case wln
    /// Wolof language.
    case wol
    /// Kalmyk - Oirat language.
    case xal
    /// Xhosa language.
    case xho
    /// Yao language.
    case yao
    /// Yapese language.
    case yap
    /// Yiddish language.
    case yid
    /// Yoruba language.
    case yor
    /// Yupik languages.
    case ypk
    /// Zapotec language.
    case zap
    /// Blissymbols - Blissymbolics - Bliss language.
    case zbl
    /// Zenaga language.
    case zen
    /// Standard Moroccan Tamazight language.
    case zgh
    /// Zhuang - Chuang language.
    case zha
    /// Zande languages.
    case znd
    /// Zulu language.
    case zul
    /// Zuni language.
    case zun
    /// No linguistic content; Not applicable
    case zxx
    /// Zaza - Dimili - Dimli - Kirdki - Kirmanjki - Zazaki language.
    case zza
    /// Invalid/Unknown language.
    case unknown
}

// swiftlint:enable type_body_length
// swiftlint:enable file_length
