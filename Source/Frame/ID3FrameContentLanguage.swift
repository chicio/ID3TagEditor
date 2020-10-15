//
//  ID3FrameContentLanguage.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 09.10.20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

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
    /// language.
    case dak
    /// language.
    case dan
    /// language.
    case dar
    /// language.
    case day
    /// language.
    case del
    /// language.
    case den
    /// language.
    case ger
    /// language.
    case deu
    /// language.
    case dgr
    /// language.
    case din
    /// language.
    case div
    /// language.
    case doi
    /// language.
    case dra
    /// language.
    case dsb
    /// language.
    case dua
    /// language.
    case dum
    /// language.
    case dut
    /// language.
    case nld
    /// language.
    case dyu
    /// language.
    case dzo
    /// language.
    case efi
    /// language.
    case egy
    /// language.
    case eka
    /// language.
    case gre
    /// language.
    case ell
    /// language.
    case elx
    /// language.
    case eng
    /// language.
    case enm
    /// language.
    case epo
    /// language.
    case est
    /// language.
    case ewe
    /// language.
    case ewo
    /// language.
    case fan
    /// language.
    case fao
    /// language.
    case per
    /// language.
    case fas
    /// language.
    case fat
    /// language.
    case fij
    /// language.
    case fil
    /// language.
    case fin
    /// language.
    case fiu
    /// language.
    case fon
    /// language.
    case fre
    /// language.
    case fra
    /// language.
    case frm
    /// language.
    case fro
    /// language.
    case frr
    /// language.
    case frs
    /// language.
    case fry
    /// language.
    case ful
    /// language.
    case fur
    /// language.
    case gaa
    /// language.
    case gay
    /// language.
    case gba
    /// language.
    case gem
    /// language.
    case geo
    /// language.
    case kat
    /// language.
    case gez
    /// language.
    case gil
    /// language.
    case gla
    /// language.
    case gle
    /// language.
    case glg
    /// language.
    case glv
    /// language.
    case gmh
    /// language.
    case goh
    /// language.
    case gon
    /// language.
    case gor
    /// language.
    case got
    /// language.
    case grb
    /// language.
    case grc
    /// language.
    case grn
    /// language.
    case gsw
    /// language.
    case guj
    /// language.
    case gwi
    /// language.
    case hai
    /// language.
    case hat
    /// language.
    case hau
    /// language.
    case haw
    /// language.
    case heb
    /// language.
    case her
    /// language.
    case hil
    /// language.
    case him
    /// language.
    case hin
    /// language.
    case hit
    /// language.
    case hmn
    /// language.
    case hmo
    /// language.
    case hrv
    /// language.
    case hsb
    /// language.
    case hun
    /// language.
    case hup
    /// language.
    case iba
    /// language.
    case ibo
    /// language.
    case ice
    /// language.
    case isl
    /// language.
    case ido
    /// language.
    case iii
    /// language.
    case ijo
    /// language.
    case iku
    /// language.
    case ile
    /// language.
    case ilo
    /// language.
    case ina
    /// language.
    case inc
    /// language.
    case ind
    /// language.
    case ine
    /// language.
    case inh
    /// language.
    case ipk
    /// language.
    case ira
    /// language.
    case iro
    /// language.
    case ita
    /// language.
    case jav
    /// language.
    case jbo
    /// language.
    case jpn
    /// language.
    case jpr
    /// language.
    case jrb
    /// language.
    case kaa
    /// language.
    case kab
    /// language.
    case kac
    /// language.
    case kal
    /// language.
    case kam
    /// language.
    case kan
    /// language.
    case kar
    /// language.
    case kas
    /// language.
    case kau
    /// language.
    case kaw
    /// language.
    case kaz
    /// language.
    case kbd
    /// language.
    case kha
    /// language.
    case khi
    /// language.
    case khm
    /// language.
    case kho
    /// language.
    case kik
    /// language.
    case kin
    /// language.
    case kir
    /// language.
    case kmb
    /// language.
    case kok
    /// language.
    case kom
    /// language.
    case kon
    /// language.
    case kor
    /// language.
    case kos
    /// language.
    case kpe
    /// language.
    case krc
    /// language.
    case krl
    /// language.
    case kro
    /// language.
    case kru
    /// language.
    case kua
    /// language.
    case kum
    /// language.
    case kur
    /// language.
    case kut
    /// language.
    case lad
    /// language.
    case lah
    /// language.
    case lam
    /// language.
    case lao
    /// language.
    case lat
    /// language.
    case lav
    /// language.
    case lez
    /// language.
    case lim
    /// language.
    case lin
    /// language.
    case lit
    /// language.
    case lol
    /// language.
    case loz
    /// language.
    case ltz
    /// language.
    case lua
    /// language.
    case lub
    /// language.
    case lug
    /// language.
    case lui
    /// language.
    case lun
    /// language.
    case luo
    /// language.
    case lus
    /// language.
    case mac
    /// language.
    case mkd
    /// language.
    case mad
    /// language.
    case mag
    /// language.
    case mah
    /// language.
    case mai
    /// language.
    case mak
    /// language.
    case mal
    /// language.
    case man
    /// language.
    case mao
    /// language.
    case mri
    /// language.
    case map
    /// language.
    case mar
    /// language.
    case mas
    /// language.
    case may
    /// language.
    case msa
    /// language.
    case mdf
    /// language.
    case mdr
    /// language.
    case men
    /// language.
    case mga
    /// language.
    case mic
    /// language.
    case min
    /// language.
    case mis
    /// language.
    case mkh
    /// language.
    case mlg
    /// language.
    case mlt
    /// language.
    case mnc
    /// language.
    case mni
    /// language.
    case mno
    /// language.
    case moh
    /// language.
    case mon
    /// language.
    case mos
    /// language.
    case mul
    /// language.
    case mun
    /// language.
    case mus
    /// language.
    case mwl
    /// language.
    case mwr
    /// language.
    case myn
    /// language.
    case myv
    /// language.
    case nah
    /// language.
    case nai
    /// language.
    case nap
    /// language.
    case nau
    /// language.
    case nav
    /// language.
    case nbl
    /// language.
    case nde
    /// language.
    case ndo
    /// language.
    case nds
    /// language.
    case nep
    /// language.
    case new
    /// language.
    case nia
    /// language.
    case nic
    /// language.
    case niu
    /// language.
    case nno
    /// language.
    case nob
    /// language.
    case nog
    /// language.
    case non
    /// language.
    case nor
    /// language.
    case nqo
    /// language.
    case nso
    /// language.
    case nub
    /// language.
    case nwc
    /// language.
    case nya
    /// language.
    case nym
    /// language.
    case nyn
    /// language.
    case nyo
    /// language.
    case nzi
    /// language.
    case oci
    /// language.
    case oji
    /// language.
    case ori
    /// language.
    case orm
    /// language.
    case osa
    /// language.
    case oss
    /// language.
    case ota
    /// language.
    case oto
    /// language.
    case paa
    /// language.
    case pag
    /// language.
    case pal
    /// language.
    case pam
    /// language.
    case pan
    /// language.
    case pap
    /// language.
    case pau
    /// language.
    case peo
    /// language.
    case phi
    /// language.
    case phn
    /// language.
    case pli
    /// language.
    case pol
    /// language.
    case pon
    /// language.
    case por
    /// language.
    case pra
    /// language.
    case pro
    /// language.
    case pus
    /// language.
    case qaa
    /// language.
    case que
    /// language.
    case raj
    /// language.
    case rap
    /// language.
    case rar
    /// language.
    case roa
    /// language.
    case roh
    /// language.
    case rom
    /// language.
    case rum
    /// language.
    case ron
    /// language.
    case run
    /// language.
    case rup
    /// language.
    case rus
    /// language.
    case sad
    /// language.
    case sag
    /// language.
    case sah
    /// language.
    case sai
    /// language.
    case sal
    /// language.
    case sam
    /// language.
    case san
    /// language.
    case sas
    /// language.
    case sat
    /// language.
    case scn
    /// language.
    case sco
    /// language.
    case sel
    /// language.
    case sem
    /// language.
    case sga
    /// language.
    case sgn
    /// language.
    case shn
    /// language.
    case sid
    /// language.
    case sin
    /// language.
    case sio
    /// language.
    case sit
    /// language.
    case sla
    /// language.
    case slo
    /// language.
    case slk
    /// language.
    case slv
    /// language.
    case sma
    /// language.
    case sme
    /// language.
    case smi
    /// language.
    case smj
    /// language.
    case smn
    /// language.
    case smo
    /// language.
    case sms
    /// language.
    case sna
    /// language.
    case snd
    /// language.
    case snk
    /// language.
    case sog
    /// language.
    case som
    /// language.
    case son
    /// language.
    case sot
    /// language.
    case spa
    /// language.
    case srd
    /// language.
    case srn
    /// language.
    case srp
    /// language.
    case srr
    /// language.
    case ssa
    /// language.
    case ssw
    /// language.
    case suk
    /// language.
    case sun
    /// language.
    case sus
    /// language.
    case sux
    /// language.
    case swa
    /// language.
    case swe
    /// language.
    case syc
    /// language.
    case syr
    /// language.
    case tah
    /// language.
    case tai
    /// language.
    case tam
    /// language.
    case tat
    /// language.
    case tel
    /// language.
    case tem
    /// language.
    case ter
    /// language.
    case tet
    /// language.
    case tgk
    /// language.
    case tgl
    /// language.
    case tha
    /// language.
    case tig
    /// language.
    case tir
    /// language.
    case tiv
    /// language.
    case tkl
    /// language.
    case tlh
    /// language.
    case tli
    /// language.
    case tmh
    /// language.
    case tog
    /// language.
    case ton
    /// language.
    case tpi
    /// language.
    case tsi
    /// language.
    case tsn
    /// language.
    case tso
    /// language.
    case tuk
    /// language.
    case tum
    /// language.
    case tup
    /// language.
    case tur
    /// language.
    case tut
    /// language.
    case tvl
    /// language.
    case twi
    /// language.
    case tyv
    /// language.
    case udm
    /// language.
    case uga
    /// language.
    case uig
    /// language.
    case ukr
    /// language.
    case umb
    /// language.
    case und
    /// language.
    case urd
    /// language.
    case uzb
    /// language.
    case vai
    /// language.
    case ven
    /// language.
    case vie
    /// language.
    case vol
    /// language.
    case vot
    /// language.
    case wak
    /// language.
    case wal
    /// language.
    case war
    /// language.
    case was
    /// language.
    case wen
    /// language.
    case wln
    /// language.
    case wol
    /// language.
    case xal
    /// language.
    case xho
    /// language.
    case yao
    /// language.
    case yap
    /// language.
    case yid
    /// language.
    case yor
    /// language.
    case ypk
    /// language.
    case zap
    /// language.
    case zbl
    /// language.
    case zen
    /// language.
    case zgh
    /// language.
    case zha
    /// language.
    case znd
    /// language.
    case zul
    /// language.
    case zun
    /// language.
    case zxx
    /// language.
    case zza
    /// language.
    case unknown
}
