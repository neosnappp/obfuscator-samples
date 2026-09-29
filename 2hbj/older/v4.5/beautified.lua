local _dyHSQdof = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!#$%&()*+-;<=>?@^_`{|}~"
local _hTNlmLnEHg = function(d)
    local L = {}
    for i = 1, #_dyHSQdof do
        L[_dyHSQdof:byte(i)] = i - 1
    end
    local o = {}
    local i = 1
    while i + 4 <= #d do
        local c = 0
        for j = 0, 4 do
            c = c * 85 + (L[d:byte(i + j)] or 0)
        end
        local b = {}
        for j = 3, 0, -1 do
            b[j] = c % 256
            c = math.floor(c / 256)
        end
        for j = 0, 3 do
            o[#o + 1] = string.char(b[j])
        end
        i = i + 5
    end
    local rw = table.concat(o)
    local ln = rw:byte(1) * 16777216 + rw:byte(2) * 65536 + rw:byte(3) * 256 + rw:byte(4)
    return rw:sub(5, 4 + ln)
end
local function _PUJkhEU(a, b)
    local r, p = 0, 1
    for _ = 0, 7 do
        local ba, bb = a % 2, b % 2
        if ba ~= bb then
            r = r + p
        end
        a = (a - ba) / 2
        b = (b - bb) / 2
        p = p * 2
    end
    return r
end
local _zALcxOki = function(d, key)
    local S = {}
    for i = 0, 255 do
        S[i] = i
    end
    local kl = #key
    local j = 0
    for i = 0, 255 do
        j = (j + S[i] + key:byte((i % kl) + 1)) % 256
        S[i], S[j] = S[j], S[i]
    end
    local i, jj = 0, 0
    for _ = 1, 256 do
        i = (i + 1) % 256
        jj = (jj + S[i]) % 256
        S[i], S[jj] = S[jj], S[i]
    end
    local o = {}
    for n = 1, #d do
        i = (i + 1) % 256
        jj = (jj + S[i]) % 256
        S[i], S[jj] = S[jj], S[i]
        local ks = S[(S[i] + S[jj]) % 256]
        o[n] = string.char(_PUJkhEU(d:byte(n), ks))
    end
    return table.concat(o)
end
local _nhrtDzQ = function(d, n)
    local pw = 2 ^ n
    local ph = 2 ^ (8 - n)
    local o = {}
    for i = 1, #d do
        local b = d:byte(i)
        o[i] = string.char(math.floor(b / pw) + (b * ph) % 256)
    end
    return table.concat(o)
end
local function _ZZYwFwILou(d)
    local s = 0
    for i = 1, #d do
        s = (s * 31 + d:byte(i)) % 2147483647
    end
    return s
end
local function _jYsjjo(d)
    local s = 132431
    for i = 1, #d do
        s = (s * 194 + d:byte(i) * 23 + i) % 2147483629
    end
    return (s + #d) % 2147483629
end
local _ENzdVvMsz = "001sjFfcJuZb?8;F-%%oT6K3?Y)VNoL{W7sH(*gyaAHeXHDzB>Q!Pe2cWF#iK5{!YJydQuI3;#4L3L>@aY05#cr-R{F*81MLqJL)R4Yw<cu+WHYbiV{AzylSYDQ-=O*vXvQ(-Z5NpW^iN@pd0en?YEF*af&C@>*@QdV&?S!qr*d1ozhWNmJEC|6G^H&%RRQ8qMZOFl3uSw3!ZWNm$ZKw3prV?lCFba6p8RxwC#C?;NbZhK;5ba;7MN_9_Qc5GrHIc{o5Ge1a6PEkxqadtsuc5Ol_bt6GOb7Ep^dNE8jVN^a&b8CHeLoiZ3DpNFaGjdF4aYj=#G;&2jds%Z{b3ZdlawaiNN<2PsN<m2@ZhBrjZ$x`cNjYyJF>7!|K1)qlB}_6UODShoZ*V**XG~W$QhF&rT5Nf9D^4;pT4YK&GGcmnNPcfgNH9<#YG+?EG$V6<Wm9oKOJGk>JveiDc1tTlQG91;S$AYgUP~}HYAY%zX>Kq;L1sjHN+c~maw|zSPIPT+BW68MLTpZPHd<dacwsVHWh!1HD@b)FU~x!lHg;E5OHg$wVQXr3Z&5W?ZeB}pAu2vmayv#nVPHdRbas3;YIRCUXk>R@M^kG)SWP`)ReD8ta7uN2XEAa`eQrirJUD!AKPn?$Lt<!BFe5o$NqcEYN<}<kZcA-HQ!`06Pb*0`S8GZ>JwQfIRW?CvI6Ek4XiOw@QdB%fW_B@IdU#WFS5`hSO++hJLQ-H+L{4)=Ge9w5eL`b4Hz{H`MpQ#sP9t7;eOP2@MKXIyWh;GrNKZ;?M>9NEWg}m6GdV_eXEuIzFi>bbEqZAyC@W!BH+UghAwE=AD=Bb#cqmR!HdJ$VNo`J8VkI$Vab7`pc2sU{C00)}QFv`CSVKyAPa{`GNG)wvKtV)vL`_gcMkZ1tKQ%UVQ&3h?JZy1KD^F%?HC8lZMrJE|P)}|)Y;-V8GEP4sYi3DBJ#AxlXirmaI6ZPvOiMLsR(?e&Z$n8jN?JQ5MR!Uocug`<RZ%cXD=~UtBR+L|ZgWy4bA41ZGeBZSZeCY*StTiJNjWqzKsGH&RA4-MDsnttVsk|+H!DedUQ8rOO*248WM)EDGjTzBC^BUwBv>ITI5A&vIWc`IMn)-ScxY8oDM465Fjsp|DRwwVVQy1qVmC*9L~m|WGksrFWF<W?BS$-PVpCvNP;e@8Y<_lSQ#@&6J3KNWXlGzoR3&ppDN9mCOGhh3ZAdeBJTqWVX)!4!W<gp<d38x4M<{-5b~%1aXi{xFUvO@ET3J9^QEz-tF>E|>Kz2|(Q(t;gYhz+5Vopb5U_v8veNQ(&W-T^$WF=Q%XG~XDPc>vhNLN}ga79W*Oi@#GJ#<DbDo=HNK3XV4Bu7bgYI-$jY(a2HU?_MiSXM-DRzEXVW=Us#adl6Act>JUSy5soZDcWLV_rW>Q9WZ!X*6L)dMi(AWPT(>dT(P#L_KayV_80QJV;|+COLCBeQtXrU^pXWa64LUDLy7qJ6Kg?eLQ$aab##weP=;@I8}N{L3?6xXhu&?QdvS%R5(LVI9@$rT5wBkIDK$UV`)!cX>VC(KzDd@NhxqoR&8=xJ#T1oEiEB@S7CcAIA~d4WhOpuC?iQ=J#;8#Sw4AWMN2_*HcM?XRVh#?Zfa5{PC`{GIZq*WbSgD<ZGLcRXHR5%HA!hwT1ru3YgbD_WmPs)M^`l}S5-koM}1dha(P8XR6cxOHaTuEV?Ak1Pb)P!S$=(TQ&B&4D_T`fHAi(>GI2pNUqEtED{66CR!%W~CVO^eC`(>OOL;^&azbu!Wm0HZHB2OCOJI9fR7PZPUSDWES3@~IVQ6qhOGSPuelvDgByKw)Dl#o4N^oH?S0rsWUOOp#JyJ7SX>>Jvax!98MpAcFHdjk<UsNS6MoU#xYh++CEogjYS1D3tXLoTiL{M-$BVtufJ!MuYRW~RtZ96eWV`)H1VlqQtWjB2}L}NreSVwnjNo`_GdPi|XMs_@OQapY|V?9$dQ9({{Fjg@&d2?7}N<Cw7aW;EOU^Ylob3AuZGiN1MD|JazLvd$uUspt7GdNOLLUdYXY+pS^YFQ*fK2{}YK|@GxJ9$bycwt0CW;|hhA!IE|IZJ3?cx^HvR#-=PR$@IxVS8dLJW5k$F?v>Ld1ZBNZFNy#JWxhyQ+sA(JaTtmD_LJcYC%aTJ4ZA>N-a%%Bq}y-NPS}{S!Z`^P%V3MRdqv2dQCkrP&PS5Ph>qwC^A)jVla9uHB)70Dm*|*GE_}jepF3vUm;#|U|>0QZc<1scs?^tBU)#1L`QBpS|vn7LMB>rW=tq+HDOU@du4b<Yf3k1J855Dc2PwkW_&kBGht;;Z6-%HM`LPVAv|hraBoOXFmN_DDs*v0CT%_=PC#W~Lr8NmJA7DpbweaWO?oR-ac6dLc6L)<VtQ3ibXrzyHE=yNT1`(TS8qrrReU{WC|*)Id?ZdPby755Ok!d|IBz^hGH5$PVNNSiPegZDXG%mzR#A3fZgN9MZ7EuHN-;z}V0(8ld_yuRO=VGIG$>C;M14kZN=YS5RaQ1VGdxFNRdHT@QD7#0M?E)FV?k~uNp2}jBQjV|UwBSTYGhbQL^)tcSv@UzJwH=JbUQXrYI}B4B}O+wW^HCMPD?!`Q&~JsPCqwgMNBa~El)l}ZGLQJY;09RY;<KnV?b$qV^J+yHg{Q6M^<(<b!=HHIA&%zOLj15MQUtvH$g^pC1^G{Yi&3|D>5-KLRCh6R#r_pZZukANF{n#IBQ9HX?-<cbW>tVN+@4xL}7PcGelKhBPA^%PE}2Mb!~A`QY|4PYeYj*K5kZOIATjcJtTN2Jt{|OenlpCH)&%zcs6@xKR{kaV=_W0V|8;OAxA=5K1Od;ad${XcTHa<e0D`bcvnLxC2u}nKQcvWbW?0TY)EllGB|uHQ6x`Qa(FXBNl;i`GdC((S7S$FEo3r4H91dpNIWe|X-Z~7Z+1>Ycw<>`Y*$B1K}#lhJy|U~Ur<3tQz3kQK4M2VPDg4*YEmsWBvfTNc55_RXjOJeZFns*C23f9DKS+mPc2qsVkUZ6aB6HSZc-~yO-x2RJ4b#@Dsm$|SZF*gds%*OeOFXQU@$g8OCeEseIaXbS7diWc1tELDML*#JVridIC*SgM?q|8L`73Kc`J22d}(=0G$v4LGCx&kJup31DLZC#d^JxoUvW%SXHh*wBtle0QB_rRT23%aO-?dQMM7n5HCAMPc2rt;Ol4yvWN&sOP-#eXX?#FWR9azFb#GxlDI`xOB|md&Fe-9sFlcvLH)nQfdrwnTJ7jBZQ#4{)b4zq-Sz$a=DJnHEDLp${Ln%vlNg+}=Pcb$mL?|m#VQD2cR9|)^LTxZ(Vrf51a7iV5IB!o*Vs%+La5im2KX6%XQdnbDbWAa7L_~96Rb@p^S$IN5Ia)+hBq?SxYISH!HEtv^KW}#-O)55FXHipca(XFrG;T(DRC#VADSI|&b~091XkR{BPg8JyHgI}lGDCPKQBYbzV>nA=QEp*CZ6kSCL_;k@WK=3nS1l?sD_3SkJ6AqmNiAk&D@}8AO?^&xb5J~RH&0GiJVrihb8R^>W=ThNQBF!`BVuDCHdb$DW>s=`CO0K_C1rS1Lqc;QURpR>Avk6`G<!fOY;ABrEqX~eJw$X#a#tiIJ9>FgUoAXLepq#SGHO;ZNMc57QZp??N^B`^dRJsuaY9HdaBd|{QebajMNK<QN=PkkD@8;+Q++KmL_KwWCPH_0WGZkqU@B-xHa{b4Jyv97OJp@ScQt5UMnyDbKR;h%YB@eNbx~GGSVw+XJXj-Gerh&Gerix(drDR^LpW|vZ97syBuHmzVKG%GY*|G)LP|6#Lsw))ElN#QX(}Uqdn#>UBtddjb7yljPi7==bT~~tOJH<0GG=)wb!Ij*KX*1QWI207W_EjdM?YmYJuzu3D_%HGDm^)8d`dKFLUc$uLvBoNcR?^&C@DE-COJquIC54+cXoC=Mptw&SVMb3QcN*uR5ndHF;P)wNkutXRb+2vYcerXKs-Y-M_FNJH6dqVFlcj0Su;~+XH0ctUT#M?UQRhcOC(rjStc}aUr=~!LMUfPS3G5KIWu}TZD=D)Ej?~leI;mNH)mKkBPf1jRU~>XZzd*1NNja=Axl$tUqLZmczQKCDtlKmHA!Y~V<>xGX?Z_#LQZ8*aBxyHdTL;GcqT%2COc4VC0<r+WN1KYDM}_nMR-DaU{rKOAy#y6ElzJqb9X~&c}R3uW_u%MRbf?UR%K8vS43h{R&FhLQ6^eHUNu50Z6#<UcOyGeGd(#nPEk*GIBGdyV>nqQepE_8GBtK(G%80eYi>qxbSOhYGEquwFmYrxX*4uzRCZ!;cyMG|X)`$_Hfn5cWH^3WIecDoMp9x)aBfH_Zd5&5Bx*2UJUBRcH9mbZK_hrGNn%k~N^^T&F)1)+I51#iej#*0Gf{4AGg&=rMr%?rXfZc*Zg4qRWFt&8Bs6(@C?iEQOLAW&C`CzHQZraHdv{MtJU}H*Xi;xgb8LBKPa#Znd2d5EXl`vQLRwW+Ei_10IDStyQCM<7QdMX^RcSw9Pdp=Nb7f;<RU>qIOhZOtV<js&Z9PtOacOoWRxmM7P<%dWSWJ9ic78KJLP8-jNGftBaCJ~dGEaR`Q8ZH|Hz-LeRC#Y|HZ5Z?Vmu);C^$KLH6cBFBuykySxq!jH)2#{ac@g~B}6|fbU#>HWI;84XDe(uZcJDuK4?l;KyY<wJ}MzgFd<=nBQS48ePmfBNOE9pY9Vu4M`(0OLpCc?RaAUzZ82A4MPD;?O=e6-M_wyLeLPJ=Vr5ZlOlfpTa94dsXI^JoLwq=DKPhH)ElhnVLtl4#Niu9Ud^jUUOgt%ZNH}P7H+g(BGCXZ;c|uM%G;UT!bx}P+Dsy6aSz<GLb4WpAEkaLqcq3mbFf>4IM?zRsT1b3zH-1f2L3mL@X(4WNUS@h&J5GE{UvMisDmPkwQ!Q(KOkOQ`b2LdydQnMgZB%7!OE^$DeM?4eGFU`Qbv;2?Gif|%a5+3yWH@eXd`)z8Dlsx)c0EdOc|m+kJ7sliQ8H6hd0;bFR4Y3xF;_-aNhv{Uby+<mEn-P=NIWA&QddZNGJG*ub$v-Pb!u)nSZ#GScWhxRAt6{aGeTH%BUL0+R!~PvAyz6+Y*03BdUSAcBSczebU9c*c1A%oY;ABQWIiDwKx9a8F=kh9Nj6?UOHXo5Rxvj}cx*UBPj4zYP9s8EBxg)NQ+H=Tb!~S&Z+AE~IAd6HI7CHhC@M^IOM5?VW;k>`a!)^gElX`fabjjlUPNduH9%@cWKK&%J4$<eRc~lKNF{4%C^vIgJ3}yEWms-;M`wFkBv3LoOeHF6KSzE`SxhA`DRO&lIZ<X~W?ph@baY`oV<c01aY}hpC{HPCU_T>7aa2VleMM19Nm6D|bu=VSGG0SBNKYekKtgGIayUs;UrlB`O))ZSct=z<Su}Slcu`4vSw~4hSwuKxQcGrjXF)P;PGnbNH*HT@YC|_kG;}08RXJ9DEiqPTNi94ya5qqUB~w#2Ejvh5QdxW|J0nnfI8`_ySXnAEGi+dKVP11}cyvu^MK)SYK{7BoVmW+6cr|`9YfU^PYEE%IRyi^$J4AUxXjObUD0EazT77sZb2CnIO@1>~MrLMnGFUw_SSnUdIC?ccEm}@7J#|wvdu)3=J7i#Kd}~ZWStBbxPkM4-CMYpdOFu#?b#z!fVR=zCWH&Q1Uqv`Xcs^`aU_~QeFl%xpZY4&1Gc-0ZaY`^SIdp0{Z+UP`M<jYoR3Ta=HX|)zBs*G8C?#x8C`lnxLoiHAJ5qf$dMPwHX;4u%XLD^ZMs-a=R47tdSzl{7IA}w8Eg?N?CLvW}CQfr~bvspAeN`q+dSh=_WJYKzX)Q8$H*sk>AvkY#JurJfbWc@ePcwQZPb7YMGC@}<H8oOcPjf0sRdZK0Ph@vwM<!`ODNH|LbYe9?P<(53R#sX(Y*jg6N^@mHDt9YqdP{jeWovJ6QYmsYczz^wNnt>BC1GA)D0X5&XlYg`MKWk!GD>@UN@jROMI%XUcrZU>XL>m%RbEa>Q)4T1YjZ>;adR?IU?fdqVQW%CQ$RCRSwSd9dopfNX)-Htc{WaXRYpNlMngkOBsp41GHzunYfW-+Hb^B=U_C=@SyD+hD?E5^X+}snHb8SwLri>aPD5^XJ1ACOJvAdgDN06IYBf?VWKc6dG$}!OG;VxMW>q#LXmemvUUfTsS!#MeMq+7mCQ&LdB_(N2K5#xGG*neQMm&B&H&HbuX<tGqWKT?LHd1n8JU~itX-#1&StMREDmguTP&+?QGG1+AQY}qteph=TXE!luJZ5}qJS{^(P(L_zF(XG>BTi{YdU`ZdV>w4eK0azzZ8bJ(Ds4MYeoQM@Y*kt?H$-hqH$h20IBqFPVM|_0VRlz>YBOX|R90tcWLQRCRaSN*Sz>2WJSsLlcsDy@ZZ>XUQfw`DYcxeFG*KofC{S=;CN^GuYC%k9a(p{YFgRj1cSLD1cRXM%Dt$gZEqqIHPj@*=Pj5h9GbT4ndRRLpC2&wYG*><{CQ~$gR4GVSNq1#vR!3HFG<;+|Nna#SYISgTJY#r4bR;=&D_Kr(B`IiRR7qqlBxOfSUr}N<G(T`lY;8<xH)?b>KWtZMbx2NpSWJ06JVSJROH5caMmRNjMkq=&Um;^>OFUR1XfRMAVMKN^dtiQdM<YFQN-H*XcYQoFH$p{2XgzRWbVpKjZemm_Z9`RREiEB?LReEgbVVyRRCZ5ia4jJ*b80wjc|~4!cRw{wDp)E@bTTtdUtV5VW_)OQKYKkULn%97J|S;oDO5dVLMUKjX*5_sO=VOjaxye=eq(tkAx3v*UT;uGJvefBDr`_8X>4dnePK>eb44jfGiE<-D<M-)SSmSfOk^`!PCk1rHbyB@PC;d3Do#!+duuUxJYGmBF)cVbIB;iAM^z?qbzppEUu0%AR%>xjeMx#yPAV{VFhNyiX>mVlMkZ7<OGHI?MKyLPId*p{On60lKTl92ZFz8YT1!n~I6E>iRzGQeR9AgfJUlj6PBS@qP-tsKV>Cx$J##%sc4JvYKxkq>G<PyJPHQT8U@~MwepYopb|gtfJ4kM8N+ou9Y*uVkJW5z9S2uSicUEUTQYvn4R5>|AU`ul{DMBl5RV6__UvYVBF==pESa4QAPDVvvC2c`?BTq6VbUAxHVS7(Ca(O~nLv}4GJ1JpLK`}ihZ(~+(JT*N>KYTMaQY&6#NpCGXbyZ$7O?!DVSy?!6K4~jUeK~4<Ds4+uQ%i3)DPwssHcDSsc2!kuD@{*lOl@9qdQ(qOFh)2fM{sRbM0Hn1YHnUaQYlSzT1r=XPe@EpF?dQ)D{y!*G%-0sNqQ}GYEf%6M^Ph2F*{aZB}qg$R8~tkaYaXbXgOwIa8zqzHGESrBzSpkSVlE#HE4TwEnqcIK}lw7Lr5@GZ!vIhW@l<hb~r>WNM$2FStC|CM^AfADo{{0NpMMYdT>NmQE+QLb8I*{PFO%mD>5r=PJSdaa9&YtO?z59e0NYPaXdmXGjLu%c4=90Ls>FDJUb|4aYHp#CPgSDHGFqVJYQyKMM@+?C`w`^U|2zBZ%}AZJz!sYIWTE?QC~|rLm^{PVJKf|NMIp3S4Kd2HEB>qYd~;&bY5;MO*J)3a9T(sZdoBzZ*OrjLqAJ?RaZGVJ1a#aPE%HSGcrO~Omay{UNkglC2mD$S3ycbN=8t8az;fdKQd7yKv6JCD?wyWGfR1SBXLSAdSXjUD@!OUQYvb6OkqMrT10GlC3;I)Xl-XTd}l;WDosf#O*VOWWoJfGKxuJtF>-xLO-E`_Q)P5XcQsRSaW!E|GdVVTBx*EvYiw*-T1RhpNH<YoOLuB2ba6Z|GHEh>Xd!uaeSJ?mPh@o~S6Fv3NhM1&Lpvp5Y(*t^et0HEStD*OC_^DAYgBY<U`J6lXmeg;YIAybaeY)Yc4}iaCNXj|B}qLcBVaONSTQRxVmoPVVQp3^Hcn1jHZn_7H%v}gSYBp(X-!pbPbPRHZD(;YaCkInd|-GcIU{mPaVt+NCNOeyWIk3yLQijgbzVwRdt_!lUq)|XPa$u4P&6`ONl;HTNibF<XJt8WP-{z3CMiKNWqoXPOe8i%a8OKIdtYr-OeJ|wVn%0qaWQaDK0$X_H(^nDZgM+AYB*z5UNR$BI4fXbb4*4(Yb1LnQ6_UUL_S3;eokpCIYDuIAz4~bKzeF>Pf}MUJ5zjqWp6iCdrnbebA3WcP(OWjEmB`&JuzZ_MSD9fdP`AZAx$wMI7c@@C_zqccX&B#Xdxs!R(vBvH#K2$PJKyCYDG(WHe@zHH8yBvD<N1?c{WIBc1L1#YGGqHVkS}}IA3T^RZ>wlQZ!~!PhWOsAy{89Gj~EzL0@@rUtdLdDr+%rVscJNLQz&~c_uh$B}*}VLm@tDcWiJsLU>PdBy&k#EiHLgcTHMrQ8ie2J|rPER%vreUspU>dOS}{aZO4|QE5_UQ+G;NZF)*0JWoSqCT2i#GG9PzBY0j{b0lp=X-H2iL1R`{CU<miL@`WAbvG(8BzHG)PDw>iC2>PQYBxqEGDufde0(@*em*fFYJP8CHgQf_LU><rC0HqUd2LK(Y*lDtDnc?yd21tkKvHsMLo#wOdPZwEP<MT8WGXRrLqkb<O)+&yadJg$d`Lz<LVHmtVMj80W=3@~cWy*hS!p|bRx5EwQFwJ<YH?~=C_80WC3IF-A#i(TU~N21WO7S0L}x2nL@{Z4a!gVsc_nplC~|UWUVcI&IVwR@C}&h_SvzJea8-FYQEXy*Lt<!lZbvJ4ULjOBCOK(lGh|<KCU#O}b2CjVS|N8{WMD!eL}(^BQf)XXXIWWoP<2u<Wl%IDDJ@_@IW|WzUn+Y%Ge<XXSTId&Z+a?sNklnKUn@{qUsPH(BzAZ<KS?WIRz^-lH#A^<G<s4~S8Pf@VkJyuDQt6hZbUypH&l8!O=(n5dssMPa6)Kya4L6dFic)wX>)x)F(E2sPCZyCH*_X<LPkJgJWNw`JSs*+GIMBaQ))kXGAdq6JVsMMZeuHMUnw_MR8uu>X<uR{Gh%c~J77dSXGlXUH7Q4Nd2%&%L0LpVDrIq5HCi`bBRfPeeRXwgVqYpSKT~00IX*pEel~4+bT&t8JwR=FML{J}YGosJT2VJ+dR{m|X+bS2DJ5YrA#H1XcraB<Dsw6_MnPdib}1o7d2&iIGA$@Ud15;-HG6b=c0w(AR&jJRPHJgnO;>YXG)+!BdwFm>HbOReWF>bdMSVa(BUVLKK1g_dGgV%1S70k7IcPLsP<D7^R5xlkN=|M`D`|WvKXyA>QYwBVOLQhkc|d1pB|%I?LOFJGa3)q}ZzUmhHC`wsGj3yPI4x^2X?IUIWM^Jhad34uBT05PMn`HnRDLaAXH0uOY;HeoJ41P3Z+k)}a77_hDN8t0H9s+BM|m}IAy_MSd}v{LDSKybcwTOILwJ2jNqHq-Zf8qyR&HKoQDPxvGc$BdR#!4uU?V7BcQ#gNPFQ7Dd^k5PC^#izH%>!hL1{8WW<x|sJ4!%ndo^}%R6$r^G$krSKQnT7MOb-5H%34|BuiI6Bq>^DBUX1#b6{y-b5l=Ib1*qEMK(4-P*G1%O=~JRd`eYnOH)c&Q%h+hW^7hsJbP_&M`~v{abq=BT6R!NOd&~QJas5XJ!LskI4wnOOgm{YO;bo;b4npFacp-ZL`rXYZ+9_qN?%JvMOu7!Ra!%9K6h4nU}sM|aZ-1DG-zXTUu#}pRYg}`YjIIbZ+kLDX<u|dU{g<5S8**ydQeb3Dok=FNp?qBI9f?mc6W3wDk^+IKR!P|a#kxxFn3C8F?n@mWjQl<WGQSjd~ISXWJNnTMPOQYD0WdyF?UZnDnwCedn7noP<~`Bbx2uKJXA7%CU!?mJU}pUW>+vKKzdFxWj9VjD<NPgbuxKkV=-_;F<)sbB|L9YWM(FBHdHt*eqeZNBvwRtVNYQ~BY8@6O;j{iJ7j%RVrx`!WL|Y}cy4|%IZ;VkZ&`M8Z&YV*QG7>Ydp2iKHZnO!XLu$<Jv=xiMl(fXYdL92Yj8hiAwW(gKTcG6V?J|rQAv4rYGXW1ekLS(cQaXaL{lj!A!sOJNoZ;<PboqwML}+SX)<VUcrbf?Br`T{GI2RYSw>lKWK1JDFf&<9LRxuAa$r<IQ&Un}duJn6Ln=pUPHS;UODIr7V^CIeF=<3+F<@aUSVeR@PDeZ`MPptwL{cPWLL+BHH+)DYWF;_BNohZECQWQ#J6KgnZ6+u%XHP0MQ!6!TV<}{MN<=s@Ur%#XNHZ`)J84#Baz#r<D|l^TepDlRMnOd-G*nGmB~3JOU{YU9aAF}<cvV6$YDY?6Ol4+GG(bowU}a2DIaWk6O+rFTL}6A+QF}Z{MQvqID^Ol$G+;<Fc{pxkYfeg2dqYlNbUbEMdPQbJS#e%CHc)aQC~r$wb~SxaKUF*-d3AMJQF%0SML1PURWw5*IaOAEdQ4+@bx1jKVskfTYb|15eQi)Jd_#OkQeb07Omb8vPh(>vGiV`XAwfAdJZe{UCT?qaUt(A^BqlpKM_^A$T0BrjN_t;MJ##TdSz}dsb95>}b6+haZ%;Q+H)cRhQfMe6Vn#PIU`28vT0uiIRxnOEO=VGVH7#>YO+;RJPjo4Fd~jY~S4THSRVG+fdN55tRBB#%Z$eg9GGAv$dv!rLZ8Uv2VJIXcY)(HtNHHX8QhaeoeLg;YBSkZFH*hdydU#=Rbay0TGAnvjUTa=OZDd7PD@AliF=SG0S|(0QLq&I4Kxun3OfxxSMkYl^cr{B+Zb3~>Pgr?8H86g0NPJghJv2^hVPRA}a!))oU?@r<MkaPLN>)5>O+HdpVI)d+AuvHEKx<x3X?agbG+<tLBWO)gMOG>(Lq<4NRV7wGVr@MtJ#i^3J~m}McUM>;a#TY^R9ZA(aywNrLReF1NO>}QRBJadHcc@tNp*5QU_w19RcujiGgMJ4M|~zEHAyi!CT}D_VKg}^ElhA|IbT;=XCXLXennAQKQK5=LS%D#Z9q_FdL?aXG&D(KQg(eaLSTAsF>OXWX(KIkeKABWJxFINZBb}NUPgL8Sz&Tnd?t5VG+t#=Y;i~=Qz1!uEiGwuD@;~9awA$tT4i^7Qf+Z<Pi;R`a&9+Caz=19N-!jCK1M_%BV#pEJXURbV`o=QWnn)!baHDWGJ9b^MM^1YLPmH(ej`jkIX`DSNnbWlYcY2<Bq(G~LNi%=ZER3(F+^ldWj%OHSwLVyJaj5HCU!=7U~^(mJwrcKa7B7)HAE;)G&D<AVp3jhJV`-uT2L!YXjwQ>MPVT+NqkBzXmLY#Jzr2{MrS}FID21SK|*FbU`cOuO?N^&H(+;ARXsa#RZvAiS2b%_bS6e4Dncbjb9_>IG%7NBAw)t~drVqqR3v^lQX@%KLP>j7bUjjfKS3*5NLgMzRUtt_Rd+jSY(X$HRca$ia7!>>WNu7yDnEQcP&O@ZUMYJ$QEPQddn9jkAxmsjRdHx?K4CpiVMi(@K}0!NV<|RnQ+8=PJV+rpcRX5Ca7!gnIW#~`cuq-qZF_HPIA%{PeK2Z5IWuNKbZ9DgYfdq5O+Q*eP-0YYJ0(y)F*!Xxb5ulDU^8oREoyIUAvtGHLqcFZDMK<nRVhy+C2?6iLr5}oN>yk;Pbz0lO;a=^Mp9W!U@3WSBtAkbC2(*%Q&DYFIYDhhFj#(iH9Iv)ZfaL6Qz=?)Dj{)0B`Q92A$m|fS7b6`PjPK}CMZHzb#{JDb!TTjH8*luF=0C?WJOwIFnN0;DrG!mN=;TVP)8;$Ay_GTQEp9Bcu{I!L{}qzMp|KPdrBciU`$LndU#2GGI&;eV0L#@a3OR;T2&<>RCFt0d3ZZzPHJIPPFP@bK22mdUwdLHOiV~rWo<)GNhWkFNkVUPGJQ!<Y*#jPDo{~lU?x{jaeF>hPEtoDGje(*ctBHZB{6DMbyO*GC`evNF-B})Ra#GEaY1EMPFg5acsXuQa4mOoDr7igSZ{PvCTLVjb4n<FK{iZ#eOE(XRyH|xPbPOOaZgW8Xg4%qP%Cy?bYEjJPiSOODlI*JIA~-vCVMqZLwsy1WjA$IeOPx(Z7@k$U?E>%S9((|N<eotW;rQrD=ADgO+P9~c~>MPZag$(MtwdjMmS4Kc0pn?N^vkTcXCK-XJjQNMl&!qO=Ep|LQpGxXH|VFW?p<FZaZvZIX6ZvXl7_&b6<U0IY(D)By&M3a7kiFcz$zQN-|APZ$CqEK0hmGU|@PjVJ&%MaDGEVd{0(SD?C{wSW-JtUspy<Q$ao?dtgjtC^KkmL^OUVU{Y^XC@4Z|NIPnKRZ2KkRy}TQY-?(7Od(EpYa>1_I3Y`NC{R3QWJ`2<c~Mp&RbnwzaYlDvaZF-APGdbtYd17iIYxUlF=T#cV{>L}IaW_hW=l>qMOI=eV{B_gLse-%dn;8{YGx%UC^B(!O*3*>KTlaxQ9w04SUG4jQ+Rz)KuvKtU`;DvZz^tbV0>~mWFt#OaYs^3L^nH0N=s~SF(g1oLuGzdIZJgmVk<B?V0C9yMPpJ@K5SujWGhlDFn392Qe|O$Jx5|FCQ2|Na8O`Tbu&tDC3a9~RWmnXPj*jWN<)4zGgMPyQ($R$KW8v*L0&d@d1f|ZQb1sHMQ%AND0Ep)Rb@V5PJC`xGAl)Le0wG~A#r_dd37mmP(U|EeLO8aWlu?REk1rZdNo3LO-Or5XLTWQNF`_^RWoyFQhReuay>O9K~{8Ne0d=)R3UItN;@H6KQu&TStwK{YHU_sNODsqFfCAEKYnm=M0hnbL{3yAX?Q_LZ9+d{GfgRANpmGdL~=1=T60BcVtjmQdp1F8Wo=hvCVeAFd3{4eRw-IdP;Y8!D`8E1H+N$-YioW^ZeL<8O(<G#emE^qaXck)Su${NU|w)aSXMP&CTu}tXe~%eQ$jy_c2j&%V<;;<eK1Kxc}-+DZfHqtXCqN<UVJ@0LQPtEL@jwOMRR3oV|zPdD@u4aQg>BiKx{i<d`~8AUVTGTJ3lEXLOWkzV^()7R%vijVJKoYNpfHzWl&!^PBe8WAv;$wIbTphNLN~8aCIYoD^prPKUP3mGDdwVdo@rhC^BSuD_TEfc`<ZSRB1;rW>F(mbZTB9eL-?(H%4(rYcfe;I8!}Gbt*zdaVc?lP<}>kdQxjuIeTAHa&kN>MPw*Bd`u`yRyk-zR47wyFikjRPAhC!X=r3hQbR*yS1nL#Ky6n_C|OiQYEMI7B}sE&Re2^bGJ8#Xcw;1MPk35MWp_nNR%a<UX-H!<X<2GWNm^GvO;tlYa%D$*T2)7Nb3sdLDt9tVV>x9uNMS!aD@i^`dU#4-dsri2O-6ZpN^xvcW?xKEe0F3ZZ#GnHGC_1BIA%;_dQ>4MUny`qR&8N3S8RJ~Ye_qIOngRqUt>=uO-xv4QCf0wNLN%NBSSP{VoGahD^E`*KyXVyD^*TjKQS<PMrl$)ert7kcUCqiFiv??U`=8^SaeJ>Qe!|kHe)$;DkXX_M@B71S5I1TGC_JoVRm{<M00yEI6rb?BQ<L|OK?#>MtpB{PF74IFiL(gYcp3zS#2~yK51f0WPE35QFm1~Ss^h$Vm>x|cWEI?LnJjhDJ?xuX*G6qBq%vkRzg}Rb1QIPJRxX!R#rW8MQT_`aA|O0b~8<4LnC5Fe0EZPUQkmvZ#QXJMqgMtG<hp@Z*V18dRHVgD_21yd1YT=Z)jd6Dttn0Sa~f_bU$xdct%$-O*DB$M<GfyUu$<rEi_kZLP;$#SSC0&duVVaG%Y?uJy<1kQdMMYDJV#LN<&w4dU|0gGb<x0OG{r)X-`5)Jb6lScRhZ3GDuNgI8;e$c5GQbHz8I&X+>;AM}1##CTllJen47gdOJZhD@`<dRZV<)bxc2QIWlBpUT08rU~y0>bxT2gElNdnV>wMQBWi7VR76N}J6B>;MrKBCRv|(`a4}gjL`yzJLNR@6QG9YfMKE?!cx_~AG*56+R7W@_Wj0YNVn|^>a92MjQA0jMZZu^$NL6udV?RM=Jb6QOczkVILMTf!C{ubSQbILUQ$BhjQhr4;DQ|dpZF@{YN^)vNRC8BIP)9f_HYq<?Lq%kMB}HC9Y$b9fGB|uYcXv*9bZ19SaCT!@SZr`{Mk;q;YkW^KP-Zk=S#4NMLvdkBdTU=%WqdPHAy#!Ha#MXfG9gP)b693DL|Q6NB~&O=EjT1)XfaYND_T5CVM#t-CUItTStNc(JTP-sU@}QKbV_O^Ybj4zK}vRBS4LBMW<YFJJUCu?W->cAYji$WEoW|6XE;Y*a4I)WOMFCgP((ypOloXIN=HsbGiYTuQgty>HD4%YB_=&mD>F4`Oj<p8RZ4PKPFf>nem^{Dbw+o4eNawsY*JGrJRwR@VMIhwaaww4bXRvgDsx{sX;mvcVRI&RI8r5YC_E-9X>@FRK2mW`d44}`Fm_WuO>;dcSUFTSL?}}zJ69`tV?<S0Rx4CZP$+LWb5TWUJ2O@!QfGa0L}PhXX=q|ZFg7c1a(-1wM_wp<QZ^_tKr2{4ZEj&kH7RjuGdpodQzdnEGh;?7ayLd<LOwiZFn4QaM@4CRaY9QoSx8zWaeFvbeQZ-|KX^koZaZ{wT6-yUDnMy@J41FmW?m&yDpqcJDsw(}XJ=q(a!ocuerQB9VtgYvY&Iz{K50=TPHI_mc6=slF<B@#UQ2FIa6Mi^G&W*ZBV#*RJ~>E4Pb+diLL+N+dP*r!Zb?f{F+*}oDsE9SWn?LJR7Ev(SU_=5Kv8UTc5_j8Nkd+1Gj2&>cQreDR%K{qG-zjiO>bpcYc(=KW@2VoV@G{UQAsvcN?0-_IejW$aw{!wI6ZkODosH%P&Q#rH8WlzF;Pf(LO)D&MRR9aX*Fp=Q8QX}c6vu)bZ1^9NIhU9a6UstHduQ(GD=WUJs~?XJw8BLRUt`zUuH;1Rzg!vJZ@$@ds;YkXm2@fYjSQ^X-88_aXmmGXLD&)OM6*oI4M9wK4xJyX>oT>KRzZ|Wp61{GB6=<NPbv!U|uC7Gi6~~Gb?9aL?|+KCMA1VX(UTtGf6N@ZDT`cS63@vbzpa3JWD)qB}r^>C|GVaePlmPdVO_SQ#3(#Ut&{kFk>ZkMLbh%Z6-TsFmrt+GE817c1$TKQ$bNxZev0<VOJw*c2j+CeO6jaS~X))B}Oqr"
local _SGkAbHtff = _hTNlmLnEHg("0000Xw%F+J_+U{mP{|a(Hw@dnTw^%!w7B|>lH#lgTbgU3B>(^b")
local function _CESLuQSEU(d, p)
    p = p or 1
    local function u32()
        local v = d:byte(p) + d:byte(p + 1) * 256 + d:byte(p + 2) * 65536 + d:byte(p + 3) * 16777216
        p = p + 4
        return v
    end
    local function f64()
        local w1 = 0
        local w2 = 0
        for i = 3, 0, -1 do
            w1 = w1 * 256 + d:byte(p + i)
        end
        for i = 7, 4, -1 do
            w2 = w2 * 256 + d:byte(p + i)
        end
        p = p + 8
        local sg = (w1 >= 2147483648) and -1 or 1
        if sg == -1 then
            w1 = w1 - 2147483648
        end
        local ex = math.floor(w1 / 1048576)
        local mn = (w1 % 1048576) * 4294967296 + w2
        if ex == 0 then
            return sg * math.ldexp(mn, -1074)
        end
        return sg * math.ldexp(mn + 4503599627370496, ex - 1075)
    end
    if d:byte(p) ~= 76 or d:byte(p + 1) ~= 85 or d:byte(p + 2) ~= 65 or d:byte(p + 3) ~= 85 then
        error("bad magic")
    end
    p = p + 4
    local nc = u32()
    local k = {}
    for i = 0, nc - 1 do
        local tp = d:byte(p)
        p = p + 1
        if tp == 0 then
            k[i] = nil
        elseif tp == 1 then
            k[i] = (d:byte(p) ~= 0)
            p = p + 1
        elseif tp == 2 then
            k[i] = f64()
        elseif tp == 3 then
            local l = u32()
            k[i] = d:sub(p, p + l - 1)
            p = p + l
        end
    end
    local ni = u32()
    local c = {}
    for i = 1, ni do
        local op = d:byte(p)
        local A = d:byte(p + 1)
        local B = d:byte(p + 2)
        local C = d:byte(p + 3)
        c[i] = {
            op,
            A,
            B,
            C
        }
        p = p + 4
    end
    local np = u32()
    local ps = {}
    for i = 0, np - 1 do
        local _MYSFQEbjY, np2 = _CESLuQSEU(d, p)
        ps[i] = _MYSFQEbjY
        p = np2
    end
    return {
        k = k,
        c = c,
        p = ps,
        nc = nc,
        np = np
    }, p
end
local function _BkoscWi(_ZwSOlN, _GbbdAIoOPCz, _JIjcMZ, ...)
    local _VjgOtniMPv = {}
    local _nreqwELTMpb = _ZwSOlN.k
    local _fkkcoVQVQ = _ZwSOlN.p
    local _ZTDbohTbs = _ZwSOlN.c
    local pc = 1
    local _MR = 0
    local _ic = 0
    local _lt = os.clock()
    local _VL = select("#", ...)
    local _uMxtmd = {}
    for i = 1, _VL do
        _uMxtmd[i] = (select(i, ...))
    end
    for i = 1, _VL do
        _VjgOtniMPv[i - 1] = _uMxtmd[i]
    end
    local _ZTDbohTbs_opA = 13
    local _ZTDbohTbs_opB = 208
    while pc <= #_ZTDbohTbs do
        local ins = _ZTDbohTbs[pc]
        pc = pc + 1
        local op = ins[1]
        local A = ins[2]
        local B = ins[3]
        local C = ins[4]
        local _z = (op + A + B + C) % 256
        local _op = (op * _ZTDbohTbs_opA + _ZTDbohTbs_opB) % 256
        if _z == 1000 then
            _VjgOtniMPv[A] = nil
        end
        _ic = _ic + 1
        if _op == 283 then
            local _j = _VjgOtniMPv[A]
            _VjgOtniMPv[A] = _j + _VjgOtniMPv[B]
        end
        if _op == 478 then
            _VjgOtniMPv[A] = _nreqwELTMpb[B]
        end
        if _op == 126 then
            for i = 0, (_MR or 0) - 1 do
                _VjgOtniMPv[A][C + 1 + i] = _VjgOtniMPv[B + i]
            end
        elseif _op == 187 then
            _VjgOtniMPv[A] = (B ~= 0)
            if C ~= 0 then
                pc = pc + 1
            end
        elseif _op == 100 then
            local _oOGOTLFO = {
                _VjgOtniMPv[A](_VjgOtniMPv[A + 1], _VjgOtniMPv[A + 2])
            }
            for i = 1, B do
                _VjgOtniMPv[A + 3 + i - 1] = _oOGOTLFO[i]
            end
            if _VjgOtniMPv[A + 3] ~= nil then
                pc = pc + 1
            end
        elseif _op == 173 then
            if ((B >= 256 and _nreqwELTMpb[B - 256] or _VjgOtniMPv[B]) < (C >= 256 and _nreqwELTMpb[C - 256] or _VjgOtniMPv[C])) ~= (A ~= 0) then
                pc = pc + 1
            end
        elseif _op == 94 then
            if ((B >= 256 and _nreqwELTMpb[B - 256] or _VjgOtniMPv[B]) <= (C >= 256 and _nreqwELTMpb[C - 256] or _VjgOtniMPv[C])) ~= (A ~= 0) then
                pc = pc + 1
            end
        elseif _op == 138 then
            _VjgOtniMPv[A] = RK(B) ~= RK(C)
        elseif _op == 157 then
            for i = A, B do
                _VjgOtniMPv[i] = nil
            end
        elseif _op == 193 then
            (_VjgOtniMPv[A])[(B >= 256 and _nreqwELTMpb[B - 256] or _VjgOtniMPv[B])] = (C >= 256 and _nreqwELTMpb[C - 256] or _VjgOtniMPv[C])
        elseif _op == 69 then
            _VjgOtniMPv[A] = tostring(RK(B))
        elseif _op == 54 then
            for i = 1, B do
                _VjgOtniMPv[A][i] = _VjgOtniMPv[A + i]
            end
        elseif _op == 179 then
            if (not not _VjgOtniMPv[A]) ~= (C ~= 0) then
                pc = pc + 1
            end
        elseif _op == 82 then
            _GbbdAIoOPCz[_nreqwELTMpb[B * 256 + C]] = _VjgOtniMPv[A]
        elseif _op == 181 then
            _VjgOtniMPv[A] = type(_VjgOtniMPv[B])
        elseif _op == 175 then
            _JIjcMZ[B][C] = _VjgOtniMPv[A]
        elseif _op == 0 then
            _VjgOtniMPv[A] = not _VjgOtniMPv[B]
        elseif _op == 22 then
            _VjgOtniMPv[A] = _VjgOtniMPv[B]
        elseif _op == 98 then
            _VjgOtniMPv[A] = (B >= 256 and _nreqwELTMpb[B - 256] or _VjgOtniMPv[B]) - (C >= 256 and _nreqwELTMpb[C - 256] or _VjgOtniMPv[C])
        elseif _op == 10 then
            _VjgOtniMPv[A] = _JIjcMZ[B][C]
        elseif _op == 81 then
            pc = pc + (B * 256 + C - 32767)
        elseif _op == 147 then
            _VjgOtniMPv[A] = -_VjgOtniMPv[B]
        elseif _op == 27 then
            _VjgOtniMPv[A] = (B >= 256 and _nreqwELTMpb[B - 256] or _VjgOtniMPv[B]) ^ (C >= 256 and _nreqwELTMpb[C - 256] or _VjgOtniMPv[C])
        elseif _op == 74 then
            _VjgOtniMPv[A] = _VjgOtniMPv[A] + _VjgOtniMPv[A + 2]
            if (_VjgOtniMPv[A + 2] >= 0 and _VjgOtniMPv[A] <= _VjgOtniMPv[A + 1]) or (_VjgOtniMPv[A + 2] < 0 and _VjgOtniMPv[A] >= _VjgOtniMPv[A + 1]) then
                _VjgOtniMPv[A + 3] = _VjgOtniMPv[A]
                pc = pc + (B * 256 + C - 32767)
            end
        elseif _op == 212 then
            local _oOGOTLFO = {}
            for _CaAyarcLLI, _rJNIwOCW in pairs(_VjgOtniMPv) do
                _oOGOTLFO[_CaAyarcLLI] = _rJNIwOCW
            end
            _VjgOtniMPv = _oOGOTLFO
        elseif _op == 128 then
            _VjgOtniMPv[A] = (_VjgOtniMPv[B])[(C >= 256 and _nreqwELTMpb[C - 256] or _VjgOtniMPv[C])]
        elseif _op == 88 then
            _VjgOtniMPv[A] = _GbbdAIoOPCz[_nreqwELTMpb[B * 256 + C]]
        elseif _op == 53 then
            if C == 0 then
                local vc = _VL - B
                if vc < 0 then
                    vc = 0
                end
                _MR = vc
                for i = 0, vc - 1 do
                    _VjgOtniMPv[A + i] = _uMxtmd[B + 1 + i]
                end
            else
                _VjgOtniMPv[A] = _uMxtmd[B + 1]
            end
        elseif _op == 229 then
            local _MYSFQEbjY = _fkkcoVQVQ[B * 256 + C]
            local _JIjcMZ_c = {
                _VjgOtniMPv
            }
            if _JIjcMZ then
                for _JIjcMZ_i = 1, #_JIjcMZ do
                    _JIjcMZ_c[_JIjcMZ_i + 1] = _JIjcMZ[_JIjcMZ_i]
                end
            end
            _VjgOtniMPv[A] = function(...)
                return _BkoscWi(_MYSFQEbjY, _GbbdAIoOPCz, _JIjcMZ_c, ...)
            end
        elseif _op == 90 then
            local t = {}
            for i = B, C do
                t[#t + 1] = tostring(_VjgOtniMPv[i])
            end
            _VjgOtniMPv[A] = table.concat(t)
        elseif _op == 251 then
            _VjgOtniMPv[A] = #_VjgOtniMPv[B]
        elseif _op == 40 then
            if B == 1 then
                return
            elseif B == 0 then
                local _CaAyarcLLI = {}
                for i = 0, _MR - 1 do
                    _CaAyarcLLI[i + 1] = _VjgOtniMPv[A + i]
                end
                return table.unpack(_CaAyarcLLI, 1, _MR)
            elseif B == 2 then
                return _VjgOtniMPv[A]
            end
            local _CaAyarcLLI = {}
            for i = 0, B - 2 do
                _CaAyarcLLI[i + 1] = _VjgOtniMPv[A + i]
            end
            return table.unpack(_CaAyarcLLI, 1, B - 1)
        elseif _op == 232 then
            _VjgOtniMPv[A] = (B >= 256 and _nreqwELTMpb[B - 256] or _VjgOtniMPv[B]) / (C >= 256 and _nreqwELTMpb[C - 256] or _VjgOtniMPv[C])
        elseif _op == 156 then
            _VjgOtniMPv[A] = (B >= 256 and _nreqwELTMpb[B - 256] or _VjgOtniMPv[B]) + (C >= 256 and _nreqwELTMpb[C - 256] or _VjgOtniMPv[C])
        elseif _op == 14 then
            local _rJNIwOCW = _VjgOtniMPv[A]
            local _oOGOTLFO = {}
            local n = 0
            if B == 0 then
                n = _MR
                for i = 1, n do
                    _oOGOTLFO[i] = _VjgOtniMPv[A + i]
                end
            elseif B == 2 then
                n = 1
                _oOGOTLFO[1] = _VjgOtniMPv[A + 1]
            elseif B == 3 then
                n = 2
                _oOGOTLFO[1] = _VjgOtniMPv[A + 1]
                _oOGOTLFO[2] = _VjgOtniMPv[A + 2]
            elseif B == 4 then
                n = 3
                _oOGOTLFO[1] = _VjgOtniMPv[A + 1]
                _oOGOTLFO[2] = _VjgOtniMPv[A + 2]
                _oOGOTLFO[3] = _VjgOtniMPv[A + 3]
            elseif B > 1 then
                n = B - 1
                for i = 1, n do
                    _oOGOTLFO[i] = _VjgOtniMPv[A + i]
                end
            end
            local _CaAyarcLLI = {
                _rJNIwOCW(table.unpack(_oOGOTLFO, 1, n))
            }
            if C == 0 then
                _MR = #_CaAyarcLLI
                for i = 0, _MR - 1 do
                    _VjgOtniMPv[A + i] = _CaAyarcLLI[i + 1]
                end
            elseif C == 2 then
                _MR = 0
                _VjgOtniMPv[A] = _CaAyarcLLI[1]
            else
                _MR = 0
                for i = 1, C - 1 do
                    _VjgOtniMPv[A + i - 1] = _CaAyarcLLI[i]
                end
            end
        elseif _op == 222 then
            local _rJNIwOCW = _VjgOtniMPv[A]
            local _oOGOTLFO = {}
            for i = 1, B do
                _oOGOTLFO[i] = _VjgOtniMPv[A + i]
            end
            for i = 1, _VL do
                _uMxtmd[B + i] = _oOGOTLFO[i]
            end
            local _uMxtmd = {
                _CaAyarcLLI(table.unpack(_rJNIwOCW, 1, B + _VL))
            }
            _oOGOTLFO[A] = _VjgOtniMPv[1]
        elseif _op == 37 then
            _VjgOtniMPv[A] = {}
        elseif _op == 141 then
            _VjgOtniMPv[A] = _nreqwELTMpb[B * 256 + C]
        elseif _op == 113 then
            _VjgOtniMPv[A] = (_VjgOtniMPv[B]) and _VjgOtniMPv[C] or _VjgOtniMPv[B]
        elseif _op == 214 then
            if ((B >= 256 and _nreqwELTMpb[B - 256] or _VjgOtniMPv[B]) == (C >= 256 and _nreqwELTMpb[C - 256] or _VjgOtniMPv[C])) ~= (A ~= 0) then
                pc = pc + 1
            end
        elseif _op == 148 then
            _VjgOtniMPv[A] = (B >= 256 and _nreqwELTMpb[B - 256] or _VjgOtniMPv[B]) * (C >= 256 and _nreqwELTMpb[C - 256] or _VjgOtniMPv[C])
        elseif _op == 160 then
            _VjgOtniMPv[A] = _VjgOtniMPv[A] - _VjgOtniMPv[A + 2]
            pc = pc + (B * 256 + C - 32767)
        elseif _op == 234 then
            _VjgOtniMPv[A] = (B >= 256 and _nreqwELTMpb[B - 256] or _VjgOtniMPv[B]) % (C >= 256 and _nreqwELTMpb[C - 256] or _VjgOtniMPv[C])
        end
    end
end
local function _zncZJuPP()
    local cs = 1643776731
    local cs2 = 780616168
    local _QkwMFhr = ((_ZZYwFwILou(_ENzdVvMsz) == cs) and 1 or 0) * ((_jYsjjo(_ENzdVvMsz) == cs2) and 1 or 0)
    local _JrJahyVZBRA = _hTNlmLnEHg(_ENzdVvMsz)
    local _BuJXusudzpc = _hTNlmLnEHg(_JrJahyVZBRA)
    local _jkIydUOfV = _nhrtDzQ(_BuJXusudzpc, 2)
    local _mHcCZLKO = _zALcxOki(_jkIydUOfV, ((_QkwMFhr == 1) and _SGkAbHtff or (_SGkAbHtff .. string.char(0))))
    local _HGqkAl = _CESLuQSEU(_mHcCZLKO)
    local _RlSDUQhyUVB = {
        __tostring = function()
            return "Protected"
        end,
        __pairs = function()
            return function()
                return nil
            end
        end,
        __metatable = false
    }
    setmetatable(_HGqkAl, _RlSDUQhyUVB)
    local _vfKtLwk = _hTNlmLnEHg("0000P%5sAxlS)T1xtXXu34fZY(psvlebFg4L;wH)")
    local _nxuGlYm = 0
    local function _DeqzTVNiLD(p)
        for i = 0, (p.nc or 0) - 1 do
            local v = p.k[i]
            if type(v) == "string" then
                p.k[i] = _zALcxOki(v, _vfKtLwk .. string.char(_nxuGlYm % 256, math.floor(_nxuGlYm / 256) % 256))
            end
            _nxuGlYm = _nxuGlYm + 1
        end
        for j = 0, (p.np or 0) - 1 do
            if p.p[j] then
                _DeqzTVNiLD(p.p[j])
            end
        end
    end
    _DeqzTVNiLD(_HGqkAl)
    local _cKBfxPpt = _G
    do
        local ok, fe = pcall(getfenv)
        if ok and fe then
            _cKBfxPpt = fe
        end
    end
    return _BkoscWi(_HGqkAl, setmetatable({}, {
        __index = _cKBfxPpt
    }), nil)
end
_zncZJuPP()
