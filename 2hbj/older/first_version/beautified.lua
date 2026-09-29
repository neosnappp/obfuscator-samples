local _iSRyhB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!#$%&()*+-;<=>?@^_`{|}~"
local _RXRAzQQU = function(d)
    local L = {}
    for i = 1, #_iSRyhB do
        L[_iSRyhB:byte(i)] = i - 1
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
local function _ObXLsvb(a, b)
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
local _qSqNxY = function(d, key)
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
        o[n] = string.char(_ObXLsvb(d:byte(n), ks))
    end
    return table.concat(o)
end
local _bcYwSTkYvz = function(d, n)
    local pw = 2 ^ n
    local ph = 2 ^ (8 - n)
    local o = {}
    for i = 1, #d do
        local b = d:byte(i)
        o[i] = string.char(math.floor(b / pw) + (b * ph) % 256)
    end
    return table.concat(o)
end
local function _ZDogKA(d)
    local s = 0
    for i = 1, #d do
        s = (s * 31 + d:byte(i)) % 2147483647
    end
    return s
end
local function _SvgUPJG(d)
    local s = 319301
    for i = 1, #d do
        s = (s * 56 + d:byte(i) * 38 + i) % 2147483629
    end
    return (s + #d) % 2147483629
end
local _AOOIeC = "001sFFfcJuP;z`zVL@Ldeok6wd2?YSHa=;5Q7A$-O-m>@X(VK6X(UNALu+3*Ff=(~F=QrhIV)8uO;$%dK1nonK~`9Jcs_eSLun=>YHdj-EqioEGBbH}Qe;6<T69u#GEgK%QebUoEg@BYCL>HnOD#7|J9068bx}!eC`x-`Dm-XcQao`gFi&DgD?oTeVklu!c`-LCSy4SuOgBPoPFE>AaBpH+G(k`?a8fFEJ!?O1cVjj_S5YlfP$^byZ6rb{W^OZ9GkrF8P-1d7P(vg{Fkn0?XeCE6M^#8IVPRr$Z*C|(c{L_uD?cMYcYJeiP<%~9Yj09>J9b!LD>7GEbWL$lc1&a>QA}qza#KZEJRwYNGc<T<XfZKSC{Rf;V?S0}ZBJk=PHI6iYa~K@Sx0kHUweEsXkb=;MRQYiMLBzMYCm{=Dr_q?N@X@9H%CZzNI@ZSOg(vKOK@3rG$Bz?M@nZ}Zft0Gdn$T<T02E>Z7EbLHgkM=c`HO?XI61(ac*H&dq+2VGi@qHHE%*RXHsTwWL70nNmy7!Z!0%nOCwZ$Xm?|NSbTj<eqKd6d1EM3BsW1-J!LyjOl)ayL`_O@PkVTCYBEc3W<E?uHzsdMVn%pkWj;1+J7RrfD`smcczAJ6drmwsWoBi0Avi@PNpB`?Q9@8RXhc&cNLF<-Bt9}LUPMArZ8kq{IZJ71T1GfKGhsApa!FKrYd1JgUOR4JXJB<aWI<Y9VPr9CWJ+i<L?tpmd_j41R5B)HV>WV4eR^$LVnTgzT0TrrBX3bxdQNR+C_X%NDMw9ASZGdkZy``CPH#IUUTGzKH!WXjD{e?aHaJ&TLwPD~LNXy%XJ30vZdze-DI+RmKtVH1NqIJAC09XEVQWe#NpV0oAticDVNft>Ls~FcXH+pkLRT_Na5h;#EihGMNJBw&Z)|ufXF*s?ZDv${DR*Z!GGuOOMKerIJVi4;WNJn#Q+q~DPf<odcqlx0Bxh7+BVjj7ZfZL!c~MG5O=wGaAt72SY+!UIN_tsnXniALPjfU=azt8GKUq~lbu>6iIe17kYIIFdP(mhbR3uAJb1gt{GD<%vHa%Z<VnR__RwgNQOISs6DPu=DO>RR+L?v)<Rbf^_H%?GvH6cz;Bt&~|LMB;3BWX2lR$66OZ&y%AVLU=>Mp|QSM|5{QEh}DjQaD~wUv@<+SYka-doxf#T2@|baW`msXC!heBXDGVZd6fEdn!afGF3D<Wm9!GabQ_QL_=m@FmOO-STcM`aw%guR$?t$UM)*EXn0g+YCJqhUwceQUprbYKxslGKUr>ZYCKC-OHyMhKXzC?H%eAmc0@TXP$X4pR5VgGWIHx#QF3H8UVJ%3HzOk|Xgp*{K5AKIY<PNOJRwq5Ic#!ub8c`?ReEh$BX=f0M_xB0a5Q%%YI$B}bUiD6Bq>)WR(U`)Q7Keob!I3$S8{uPH(Ev}HAhBuep4Y-RX<r;Ksz^edu&NqZayVeRb??Tbw71MQY0vKb|`0YV>BveOh!adN?v$rJtZ)Ab1hFecO`yPZYpkMbzy8pFnd)iMn82}em!DEbwoCMJz92pYe_jFHgrofI4M#kG)iA{C@>}}PhlutSZ8v0Qb>DLB_mTgaZ+z*Wl~NiBQ``ZdwXbdVLx{{PBv~>Z%1JyZ7o!DR5K_$ay5NzS$8&aL3AZrdN^idW<OzUFl}mMJZx(yG&MbDHfUipXE0=Jc|}-#Ge$>fI7&cjb0%JTBP4ZmZeuhiO;BD&K4~+4PC!T_a5-*hJ|skEHcL=WWI|{uPDv<pO<qYMM?xzrGHY@?J4Q4uHB&f0G;v3FcV{g?IWlH*bShAAG%;^gY9w%QZcamUYH({xCQ?#0F<)#?VniuMRC#%MK`L)IGizT#d{0hKMR#{FeSRr*Ksh;eUV1!IM_(&LQg|q9W;8=>O>sbKUr#DccqDf`UpGKcGE6sPC~I>wS}96PPg*x%Lu7MhPdOt^IcqX)P&a*NO>RbGXE07#B~f27KYU0_BPk&?eN0y+aZP(zZ+&WTM>H~dH840gCUZ(iQ9dM6b1GG1QaMi}Qc-V2D_}M>K{8Y~eNQ+~a$-#~N?#*PQ%6HMDkNhtC~I(fFkn?uFknwvaZhDEDN=VMGE7KEO*T_=MnO<gBurmMWkzE{Ph&tWd2dQMX=-I?Ej3SWODSn=aZ7JQW+Z(=NkULJBx-d>Nlhw4dr&fVYeI2nOlMk3XLV?3U@BHrV>?W9Om|~pP%>*FIaoDLFf&0&OL#PIKXqSJeko~da%EabOJX&3Eh$BKBsN)1ZEGrFHc~`aJ2)vxZb)W6KXXb*O+9ySUNdM`a87C_Do=h+T4PB_P$_#@Ky5)LW>PUiO>H(%N<>afRV!?EP*_hbWMfZMQ#(mUHhX<$EqHuGNJdO)Wg~bhOKo#&G(#y$Sxa$2a7;B|PAhX-C_^b&ba8!HQde?CV{3I-aC|U3cPUp&UPmoTX>@gRWkpsibWtcjbu&p`Bs6n!aa1y3SvG5FGkq~gQ9o`bLr-BNVq;`Xcq=tYKxb)cN^w3tLV7!RVJ$pnKr~r?LQPIlL{&giYEo1oNINt|QYmaCb1FGCSv-3^L`WrfK~ZurC`>yvIAkPrGks)MI9XJ4LRx+}Z%{%-SY9)8d}|?KL_r}bc1J>CFmf$qJvA#&X*W@IX=Z$KIZ<D2dp9*SHd$#oJ!L#tKRannLpyyyG;ldEc~eb#F<x<LDOPS;QgTLaYGqV)aXoNVD{E6jW@Ry8Z&N8aVk3D_esNheU{H8KO=5UPBUnCWHe_EgJzqsCc41Y1dUq*sSz}BkUTsi2VKHfXa939)CSOoLI8k?3PHbvrOHqDKWI=OgU_5+gBThy<T0mh=OF3>nekf~4K2Rw_bURjFUT0clU`HW2eo0JVb4@6GQ%G@5cU3uRcsMd9KUQQzC?QNyVQe&WH%CH6R#{jrYePR$H&;(|Au~HTYEyf0DMKMNX)!S<bZ}K<cs61}dr3P{QhYIXeK2lWLnbXoGGS6XU{g6$O=e|rVMRMxAu@7UZzW)3HX%+scrAWXL_j=XVKgg!cu#CUbX87qURirkS3_xLP(nOZR!}BkUs`HbX?=7pMnyzUaw<kBc0p)0dm$r8F)1rBa7!&DSynA%B_U9FL`+&XYhqb?Q&&J)W>9@)eI#&ROiFM*X;EJ)W=K(CF(Ex?U_E?cd@^QYC`om1OCx?TXKzC`Z*EjabXh-TQ&dweQE7cbUP5|hBXwFeV{C77V0mC+cXee{W-(_{d}VTVcR*7zaau7ZUOrf6Enp>lP<Cv0AvtYwK|Uc@Ok-CjQ%WW?Bsgz)Q(AL!Dm8R&bw(j;RV{6BaaK-FQb9vRVMj81b18m!OD#P$Qa5pLD|9eYej`CaOm}^DO;TB6b~SHrD>qGMZeD6WJXbPmL{utXT0?JId1hs9M>jPid{1>uStd+(dofjUMNdCBVP;E1SSDdbW`1C6Nm+7QYc*^}OhHX0GgWbTYh_I-B|lM2Fj6x)I3r6*KtW?wDN-acI7l{YM`tZPb5DJ2X)RY+M?XAcXjoT8H6t)jQDrSEZeloJVkl--d0swKN>*P^L_jhqen&efR84VoOE4`eK~yz&RAYWdQ$Kn?P*6Q*DN1fmenoC+IBisWQ$$F2c797*GG=FSLsn*0PBe5jCN_9@Z$w~JG%0*|Vpw`NHD_~AB{5feH6%4Na79m0V>2psH9UAYb$EC&Jx@?;H8N~fOHeU0KxAhqOlwDCRX2QIMtDtUMJYZ`Gc-s<J$_+UZ!0n@Y<g!wa(FFIF(hy%b#W~wPCiymUQZ)*aB?IoV|OtqXevZySw?0}CQ&Urd|p>Vc5iTIJwQEZctLC_G(SgfeKA60CQCIfa(6@}Z!l9ket3R0C~9y&T0U1oU{gq6dNxiwD{gvren%^NBqTvQeLO8*WIlc*Hg7diO=WZ?Q9*ucMq)5EK{IA*Uq?!JSVdtnQ$<fvcyVqpA$LYaNI*7NMNwZUW^rnBKuA??HF$V!OEP07UQSdoRw_&}HAO}tHAO*rR7_qpJ7FtscW-KWduM4uKV@k)Z!%9uQ*&@pH9SC5G)-|RY&}?MYi1;0XmmebOEGs?S3p!}L1rmhPFHR-G)H4>bYm(tbtr2oWLZx^dL~Xtc_u(3G&nhHK{aAtY9&7-c0EUSW_dy*JW44hM@K+nVQzg_H&`o1L|!Q>NNXrfcX)MgEkkx`G;U%(UruI8R#!$?X<$@gSZHT*YBFGKKvs7{b5<=lQ#(K<Uqo?UQ#E!~GHpa=JUwY@UMovpN?=f8I8b9NJY`B(Y%@`GV0|GmOinpxT5~s0XHP3hOJzV%M@@4^GiE?-b2fcaa4lC;SbJV)Z(<`~BUW*BV>l^%bt`v8eoB5<DQ|L5NK9=tBvX1dN_tpPeoakRC3t0DZc{^9dUqryeRf`UOekwiAy!slO)@)mB{g(%V01`WKx!#ZHEU#YZEG@Ocv5XCIZ8n&Vpl(4ellPrZCGu4SwU4kbvtDwHBxXvHZd|xMNc#~Um-|Va7A7+ZDLSKZ#6P#J5obgL@jw$OgT<hZAx)-J3CTKKxS+xBvvR#C1pD>RX~0retsx(Xgz&TOgU~Ta49!(Dr|HnS41N}L_R`9b$M(xPGL?kUs@|ZKQV4vSU77wPd9IIZC*Z6M=4lxaWh#XXJC74Vkts*XIMEjJRy2$V_JQCQBY-JHYqSkF)JxoK|we+KvR8TL{d<6Sa)w^S5sbmGIv5yW_dDMB}_AGH((=JRcJU_QX@@lD>P(yZDB-WF>yD2HFkPqdq_oXaYjB-F-$6Sac4_2MN3OCHDO*oCP`RWDI_aYaBFiZc{EC7bTU3aVlqv6Nl$o5aUnE#H*qjhG&W39Rd+E?P*_58F)e9eVK#Y2cvEeBMs+qcL3vIwH7P4SU^`fJS0r#}U~4}(I7uO9J8xKQX>xC4QDb3iNkniyH8C+@F)CF;D|v50D0FUib3SihZdp<_GIx1IOCu;FLT@xhSbcO;KrnrGWjR%Icr8Fsd|E3dD`sg(RXs3ucXw!WZD%n_RW?dZP*giDFf}SuQcqGSR(WYzS1o-qXJsm6Z6Qr*W>PC>e05JPFkWJKQci4DJ$N{DYc@qODN<4)J9$S)Bs5JkR!(t1bxUS?C}>A=Ni$w{HBTxeXjEu9Sw<l|CRI%}JWpm+ej`34U_y8%T0=2pa!OHZd~Qc<PkKyDLSJBLJVi`WdTmmER5Le0V0=$Eb3iFRO+0UGZgo5~DtK*TN;pw>MPX7sPi-+@Ds^{2BPlmDG&pu4b~9&vU_oVGOMQDJYAty^Yc*LbK|*w3Bq}37b3afpKz1`UR%T2+Uu`BhcqCRKav^hkYB4BSRW~;_JRxCDEpl!oU{_^fem*yCKq(}AL?|;-YHMg>Vt6PtL_0E0J|s|TRyk}=R5>+#YHvPBS~FQOA#NcyRB=yzb!tE~Np(18Ej}?eQ9~qjcTsRSOg(vbM^Il_KyP|BRV#FGPbP3UCR0#FY9&l@R6lHaDN1cIF-c!qC{9UzCNwC0Y%x7vOJgxHRXb5yFiCP^FmqvWC02K2b1HOmaaA--d_*g1A#8gib7@snJ|lf4dqXvDd3ircR6ICdcUDn&bXGP(DpfK&d~sqtaC#vvDn3|bd^BY(NhwuXGe0+HbY&(@d{|glZC*)aG(}ckMp<J(H!5>jdrLJ?X>C1ISWG5PR6J&9M?ESvG<qvST4GCdBr9P<HDGNib80e3J9k)0azk_^XEl9JLVA8sX(U87aAJN~OCdFRPCiLWXdy;QGbSxGJx(S{Bt~*YO>%WXJycFdB}!9NXiHvkcPl?<O+$4gL1}wpQBY!bX;eNuSYkwLUS~TodRIeNR%>ECSY>ued|6&dVsJc8bw4&uEhAN9Lt-&ZR5)pIKuTgJZz^71BvxcbCQwITLr895NmfZcKr&E8cX=UAYd}+LN@Q|5R#0Y4KzS&6Fg$p5BQY~!UN=-hJWVQPM=CNVGJRe{RzFN|D^^;3c1?JDZ$3n0b!0<7NkJueKQ%EUXIL>|N^3%FT1{eKNJM2vOEOJtVnSCkQ))mmWnp6@DOOEtPDEZxMMhUmSv*KdBzJsHId57{Wl?TvYE6D9CR9j0MnXa}XE{MmV`58LHAirGIbd#dZe}xeD=AMzY)fZuWF<CoG(bCXesxPIMrA=nN<UyxO=(m+VsB7DNGVWcX+AwRFj+odH#IzHKuTdPIWl5cXnY|_R(3{UUM5i?Sw=}~OGq+ma6m;uMm{EUadl!sCQ5KjMNB|FS$=LfJAP?YHgO|$Sz%*WKv`0EDq2ZBcqJ=gNLDClZdPJMD^Ol2Za*nKAx&;>Dn))~cu!?mS9xY_Npe6qC|GlKF*j2!BWET|B_tzIP(nE&JTpj3DOf>2bYwzAPiHN6a#llad@w+IG)*CURWK?xZ*FB)R(*R?LN-WPb8tRhVOMfENLh7iada|fC~QG`L3wykGE;OTL_tU^Ie9Zxd1FK<dp=4<Q)W+0Ry-tRT6%6tQf^mAG)_Y#N-aW4VkBuxGI)JAZE8S#CRj2}O)5xVYG`<GN=7?UWKC}{OICeaXi#r?HFY&$b|g$mGedVHK_gyuNI_m;ZZJ}3WLHpfO?YEZC`LspJv?PQF-IdrXl_s~XLodSKsiA;W<Ov=Z#hb2Dl<V|DOY%TS0z&`JUwZ9ZZ&%~LQr>FJU@L-UUE<<Yi)Z_e0F<xB~5%kKu~&XSyxDAY&KvaOGZ9WMmRz?GdycUaC>}NV<s{@W?pc4N@i4VaBM0xYEw>2ZA&+9K0jJxWHvEZBqb#(B{+OXaCBxgSSoQaYAsZAbVqMYKSpO@J2F2~KS?zuaVdIdZ+3bmby;;IY+^TJRVz$jWOOBNU|=I?cxq>BX(V4TDPuM%cv@3KK}A4NQDlB2Z&EuZIcRP;B{xueaB+5MNJcFqKO|{nOfzDBBV~AEZ+m5YdSx|XL^x7IZe&#>btNb^YBp>rba60YJ6=?4VLo4PM<jP%W;88UC}lEzQFv}EJWX0VQ+F_LJ1|&qMS3)9b1NiXSy6CDU~_wGL|;2^Bw;{pSuHtvT17W2R55WfVPjM=KX7tHBv&LYFePqkVnic9W=k+=aV=kdYArA_UMopKR9JgaGht?4KxrgEZZI}#R!=flK2lgYS#LOGN_ToZAv;Y+OjmhHDoSfOadAjNM_GJpKsZfmElX2)G*U@-Nmp|_P<UxiZagDFZEI9#c3?6zD>p!QUqUH+K_p}}cy%y6cxr1;MkGE{GEP=0bS5N6b4`0kH*ir=VMjSCZZI-_C~06rC}?XaeqM4YZ&qt@dr*2+LqJPrF+@&Dbu%GTcY0@OLt=X+cWX;FNJc7FLneNANqcA|Z9-r&QdT1=b1QXkC^Bp~VKZh>P-IMOR%3WSF;Y){SXEDUY&k(Pbv-##J}p5bPjPH;PHJIGZasQyd^uS$J0*2!YH3GsZEQd`b0K?8U?WIBNjx-seR_B>d^AEsAthQkX+ULpD=Th8MqVLnbxUAhRXb2EZ&EgFeqL{TZGA;MQ*m!@GCX@;bY?{)Em~h-M<_u}cxhj7D?T|jR3=bDUOPcoSZ_Z(Vr*11M}BEVOHO@4SR+6sGBYhPByT=dGD~+OcXLo^K1n%2L`i63enc`rHfJ_kFnwZGQffUaR#<gMU}kJ{Pj_NxEk-Roaak*PetA78JRw0)RAEF`Fk?1gVnJ(dHzjRNWi)U^B}+AaK}dB>Zex0KSzcKyR7qzlNq$3mdNz1bKV~Z_RZMq%YDFbNWhhTsH8@~rb3AZrUQseqcuFu>b53DBcw$*)MMX6?Yi3R(OKf0QRB=aQZ6QWSGa*DaYjsQ}Fi9p#O)Vu}VSZ6OaBgrlDoZAOSU4$jc``#|GB+qqIdxG;c|mDTX;)ruLsUFuG&m?=WIj74c4J~iYI9CBSRqPgQ!_GQdwe-iXm4~QCUH`2YI#;BSWQ$YZ9_e3L}?~(C{<QHUtc#uKsho{ZEJCBQB5;?G(l@nc1|W`PftoMKWH;EVP17SK21Psdr3nvIYoM9AwhLzPe*u0AtiZEbv|ubM|WX;MIlrsOKD|6ZEsLKDMdy^Pbx}dGe&AhYfDc}RYOxlZ$&^^DsMY<eoJ^ZR&`h;YBe=DeM=-jS8G*7UrRo6bz)30XnbKfO-*fJZdE8ob4gHmM?fV{QYl_QVp4cAH92-zZfi?EFiK~5JSbjGRBtpWXEJwkNqKf)M_^cIL~cV-KW8dPO?*i(aCcWVeO`8XLNI0|Y;to?drU@CHzs*sMNu_GQ*3WHJ$ETyGA4U_Zcb2RWp-F8ZB|2aR6a^HK}Jm`P<VQFOmuHMIZ}CJWNUCqG<!2?LvKwtX-{EkD>5-eRb_NQOG!|3dqHS1Hh6R^Wil&mRApLzMKCpWBPLo<Ej1%qLSj}(BXnysM|3$fBuQ8}Up6RqUN&`VV`NNhQ8R96M`U(pYeFMzVsuw4BYsvyJWW(LF=cRLDt<F%XK8j)VpwNKc~?t)J5w!vBYI?NdVW$vJ8V}pZ7^nIOGS8RUUEr9B~W`lT1ISMcRO`%d_-+ZR$6LcG(kdQO=UZ2Oj1Q7S}jL8dRI1BZ%bAwd^~4wS7Lr4JuqlxJ2Wb8Js~JfQfOx_Vr@J(PcnRRb3I>kBwkBxdSiD@StUJTT1#+Ob7Fisd_6pRcTIk9D=k8PPBJh-eMBiWZ9zY6NIzdCSx_xKKPpaVb831iP+?dqS94KDNhEb6Ol>7>OFvF6ZY_0rH9$i#HF`2PD04<iRWN9AXmlYrJV;S1CTm7KDP=}beR6kiW^5=$Y(sK4R5*P&KP7x}Ni=InSUY)1SW-=RW;iKYQhQ=gICnfMc~f{LXe&f-Ay;;5IASewM=fbBMoo1=GIe-Xb#E|MLUAK>OHg1-PBmU%F*bExN;Gv)Q!{KpWNA4;Bv(*reR^b6dT2^$bV5QwV>WD9NO(y?bA3x?Az^xCF=#MnDK=<FPjOEwD`;ABV0TMzcPdzZcX2>zRAW_ONogTocyV4;U@$0dVOn%Gawaf1M?^O_G+uQ#Zcko5P$gAaXh$$$C}w_6Ds)F_b22nbSwvVrR%ARSL^UC7UN9s}RctYEKxjfqZ%jB@BSdXpF*ZMKc~L|rV<;qICNnE*G%`4HICw{3b#-uaBX&SGCNWWPRY4_mWlS|wU|39GUMMAKDm*-GW<WV>DKtfCUnxj&G$~A4dm&9<F>`iBIA2w5G(1u}WN2PCDt16`cqCb0KVo7wVP!Kxd00VvMtw*|a9SlKKP5azV0SGrMMpDjXCr+wU~@_;DrHSRHa<sLHEw2NLQpw+HbY2ZDr;#ZdsrwpPJ1a@Yd=^iGe=lMUOsFya9>DkY)3veG)gj4I8i`IBw9d0WJq5{ZhSa&S5|9PK0jYkQ*t$JLpEo1W=~WtXh%<EHD^IRc4Jy^L{?@{bysgUPEjR9P+@X3Rx34FFi1CiO-wa+Dk&;*KUZQicRM|HI5R>kKsR|)L^5AfaWph&WkY^DO>sYbOLr||ZgnwDM?E`AHd!rUXe%~PQCf6QQdUV$eLa3mJV|3JK07~aQBOWXXE`fteQjVWIZ$SKZA3tEGiX{xWkpv|dS62{bvu1=YBzmeOGji!Aw6wMEmI~bbZ%&4Mt5FFU_^6eMQ?N_c5OjgId)JyODJVXKTm3CMnP>fW@j^Icqv&^Bx^KrQ$|)}Yh+O<d}u3KSy^~8KSnZrL~&<XJ~(+fW@mRaJ}6T(QeaA2MpbieK1@VsOKEm}Y&1qAB|>m%R5(66c0)9BT4HuQGe=8rH&$9hUTt<te0wT3czJkoBT#5-IWRkJS8YvqKS6hRMMqR5SA11*a4mKra!o0AH&<?JT55TEZ6QovKx9a4VMT0VdOIUMNGNc5b~s-sU^PuvWnm<AVqar=FgY!KBR_aIY*R{QK}1D<b})BiX<0U9IXFQrW^Q0iaXv+1Ry#muF>`byb~8CdElo~4QG0thUqVq(XEJwDKRropcO@fQT4P^ACLvI1LPAe5K1V)mOe<hySYLESRYr1gcSe3wFi1mubuB4&VqSD!DOV$3V0unVVs<u6DsOjdQbRsJcsV#oSUV|ePHI&sG<ri&N+wu8B~om5azRinUT0G<LSs8LKYURuZe(dnMN@b+NHjn>WJOe3ICDThdr)dxJ4z;Vay2$2Jwz>FBvoxIQ%_e^Kr450UqnwkF-S;KXK^TAHzsE>BUxHRFl0(jQb;sMB~w^yNm^`5WnOqTUSu#WeoZ4}N_l2PG+{z*Pbhd+SSlzaesOs}Xev!cLrW=gJ3vEeLvKk{WH3%pIc!5USXV7_Ha#U{LpxbEeR)PxXl8gTGb(RpYfD#HbYL=lZ&7w}QZ+SqHa$*Cd2@GHbZk|9bw5C2BVtl5Of4lbQ#5o*Mrd(sLuPwdKRr7!c6>Z(U_dicNm*V}J1{b7LNIbFVKOFVYd0`hR7p!<S9K#sJ!E-WBTy|jO*?T=VKIDuVmm``eKtW-aCSsJeKBk)R8xB?UQHw@b8$~2Vpu3>U^RSCK4W%6T68N~Xhc?iXg*hTH&|s$a%3i1Ax<kbJ#B1db74;_bVMOeFkww5Sxiq}H)eEuO+7bXOd~xucQ9E=VogUgSY&o{L@6aBSY}W=J|Rs)P-a6(Q+Z)nLU>0qSXW^*Om{nXJZ@fAIV(dmHho@Ca&1mnP)K)lKxZjeL`H2uGEPQkdv0VqZA@1}YkV{{PHA{-e0O~#dv7~FLPB~uMKyP0BTgl1L~4CrM`Ck(QC>_~J}p)xHY+1nJzjlxc2-hHMo1<ld^c-DAwP3KZgg-vOG<QQLS=eQRc=RDcXK&*X<2?dazbW#Jz``wJ~3l8U_47@C3RLbKwvp>QdD9pK|C#TF=ljgGcjZ^bt+<NaA0R;Ia(zsYgSfsP*`jsPD3O^cqBM`dQnSsZzWSRMMX7sQF}FOdq_}vC~0XcF-A^3JYivKQ++BvF>5Gld_-?%YdAH2R7Ws-Qde+NWivBTP9bJ)Uo?4oY(*n!bU0dWS374(Vl_ZKdqz$?eqU2lNiuJCP+odeW^^T4K`TskGiPEmb2Df$Y(G$7KvF|NdLw&hOk*ZNKW8mhKzdV5Xd`MWdQMtDU|MQ+K`UTLO(9WPc2svnS6XCnDQsF_OK5T_a57IeYEMLMFjr$gQ(9GJZ+J&lIB#iGKXo-uT0KyEc|0RdQg(4TEplpPBSls%Y$i8qNq8xBZGAl<R(wJ-d3j`gHeM}WG*Wq5c_TnGPbF_^a6&SBR75)=IVChlC}v-BLpW|&SRp|sVK{1DbV^h<Oix}wU??&%bu=n-I5S2_Wo=Pra$#9NBsfEQWnLywCO}wHFh5u%CRuD`Hb_@bWOZdDHdt|TOmI79GJRoWDkV`lGkZp7KPqEHa4ThIP<C)CJ4Ik*J!pO*XghFOeNk{%WN2$qJT*dWC}TH7d00YWW<g6UYeG3`R#_oESUps0b#y;iKUhdNAt^{oZ$fKQVJJUqD>hJhV`EiFOM7%Bc3L)Vay(d4d17LDK{jGOYClUUI3zMOdqZhecyVrMRZ?SPDM3kcOmkBsH%TNkMmbtyDSJ6YRCaMxPDf;NZaXw;R#$9kKUhP0bZj_8NOWsvWO;CBJ5@Y%Y;aFNZbN!0M{0dJF*j09BvW2FP%vXYZYx$#Nmy-4b8vfVC1*x8KUz65J90@fMPzkpF*rtkR5m|!K4d5|eMV1FO<Ht&J}`ArLMCP<KQ~!!F<Lz`L2ODtdMI#jcwsz8HB~V~F@8WPZfz-2cSbcbZg5h5Z);~YHAiT4OlC$}Nh@P`b#hizUm<NaXi;S-N=`L9W<p_7cvvP>a&Buyb7OXWK1_K_Nna*AU|%G0Q(k9RLUBG=QB8AaHeP*IN_uf2KT$wpWOY?|Lo*>hGCWo>PefLIcqLR#OEo=bH(?=GBS&6zRV_ngQ&~)KGB{djD^(#hd`e$9Ib%;ZJ#sNndPQ+LVI@!_NoQ9!S0Q*$Ff%AsUNmDNGJ9V~N@YG^GgV7jCMF|SC}e9mH*9D!XLwRdAy*}RZ*+HGaZ*8MD^6-@L~3wLPeOA<S}<o?Gg>fOT4`WpUOqB+D|}99BX(e7HEvdLO(r8bN<2&`bXsgfa3*v}QdK`=a(+*8LNQBdXEk6WOD#quNIP#zcRX)mJ3d8zdPQ_qMPXoWMJPpVZEIsWO;=8Ocyvr?Pf|H`SyU}~OEe=@Zf#>^Wj}9pV0>9xIAL!!GeA>IOI2}oUv?@|Z&oQxLNjPPM@?ulOKwnhC@m#HM<Z}JOi^b>LrrBNbw?<8dun1RZF_xDDmY+xV|6NRNmNsHGgEGUaBNm9G9+kOHCJI)b7g)=D`8b3G$ccJXnS%_dTC{RR!wMiR#Qt!csN5xHAg`zLo#V~SVns{LU}W2C1fOOZh2r=B{fVjMpig)J0(1EC4Mb4c~N6DK4f@mJzq*+NGVk?BvxlFcUp5pT4!`@Q+Rw&H8v|TKr$wDDseMGN<~w7YIAThD>g(ZcxNzWOG$2RJy9rHdsJ~_T6#uwG&^ZgOMFyEPFPtreMMJbZBA7xS4l%QMOjotYB_u;d2mi}J8NKmXFF4JUUD&bDRFW=DQ+@!S5hf>K}l<MAvHZqBUCqXUO#GZOD#WiRY*BcOnEYXa57<LB}-{AMI$jOB|l&#D=;d2acO%wBxFipT5VTuJSr<aUpsa&IXpEgcTh`xGcs3KZeV;uc5ESVH+wiYd@yJxIXzZ0Voz*iGbu5AR$zX0BurjMCQnaHadcT^N_ZwdJXURBb5%QZJ!N<yBS=I`dURxYUQseZa(GWAd{8w%H!x5=XH+yzb0kYvVLdfXU{6*xHE=vOV0t!1W?m{hS}k!oP(w0uW_Mq3V|77rb2c+}NM?E?XJsQnL0>#`BV<`sWJFXsI6_rfaV=JGXiHa3adKFEMKp6aG(~k*C?<DkO>lC1Vohp!M`%W1erIw`b4XQlRBb9sMP6ZaYDQo-Id6D%J3ux)IdD!zaz{61C?sM}DO5r>WGG){PBeK=DKRj0cV~1qG+#|SG<qX+Xj4c+K4eusVOV~BX-aP>cqma=Gk0lbP9`fjPE34RICL#WV?HV+d1f^wc4|yLLNb18KPGTULw+eyRCX<8GCyxYM|W#)WM)tyK4d>DZ#_6jacOQjNklt#ZG1R3Om=5BPbp(4a6mFwSVm+;Y(IEaO;=$pL2NTlFiv28bU1r#D>PGWct3PkSUoj!aX)=xb96p%ZBjE<a!53DT5V25WPE5~b0a={IY=dYLt%4RH)>=tKRr!#L{C^wRU>CeH%&)LZaqe7YjbR9P)$xzY+q<hbXYcFD@!UROL|&wSaxuARdqdHGE!w<F<LZYN;fSvOD!cfIb%mRbzdY>N@-&>U~zszEhRNhXHg?)LNO_DS7mZZBTXtJU{rp2CVDU?ab;$0eo$0lM>0MtKRA0|K5`>wLMBRWSUpc~a!68YIWlcpcYI4KaaVOiDKIT0epqfQC0=SVGEXCOacF2eN>?UAR&9Q1C?POwdP8JPH$P@>K`CZrYjs0TN>NlWZE<#eK0;t(OL<Fgac)ahJ3oGCIWZ_IL{DpUC3QwbOd}{MV_!EsYeHf`dr@U(L32zyD?xEBNoq7lQeH7$CU{g&Pfl$uMK@G2ElnyTMI|t3NNQJVT1GrWPj5<mXij%`YI0*aSuk^LSR-_MZ#!T&X-71CMl~@rNKz|QW;SPZc|SI2QD`JpI7vNoc2aw6J8WuBMS5{^X(UH2O)YpPaU?cgWkq%|O=fXwK}S+?X=6TQdu~uhC`55Ndp&b&IYw(wWoB$4LS<@Bc6@bIS!zyscT8|}RYg;LSXM1fbyIgqetJB0cV%dOMOQ{GQ7~6oMSN>?YdLyFQ)xD3Un4UnUuSH5GI4oWO)@1yCQepPYIA%mN+WM!Doto6KT$q-Ms-6eDkN-LA#q|^Q!!vMd?hnlR&iiEW^OSuOCfY$a(h2DEqY~ZV0?L6buuY=J3Mzsb3kb+Z!%(KIXO!{BV}n|R6s#$NH=3aEkJubbuw~DOG$S#XfiE+aYbrwG%06Dctuw<Kzm4DJ92q$dqit3IejTMMQ=cSPBUtEerRrLaZM&LK2c?ROg=n#Vr+OzZ(uECBQ!BqR8dVfaWii!DNr?TXEJnec~p5bd}}~)D@AuTK4f+^c2;pfYd>UcQb}TFVQ^wfY%@MKa5#8AAw(uPL_2aScwcLIO+HFQY-nvWb$n|@BTXbdNH8!%cy?ZIDLG<cMMz9MR8=@dGf;3!Omi(!cyM25UT0!ZD1CWhXHG~tS66UNUvoHeabI&<JXlykIdFJyMP({>J6cIMOh!3RcVTBFSa3gRGcsmDCTcJ@DQ9g<R#8oSa!PSZJw`ksV0SZMOj;^;F)eFQa!o%(HzrF%A!cP>T6rWuNG*O(Y&}O)ICF71Pe^cDRa16AMQ=|eK4~O!b#zR3J91eeZ8>FiO;<EcaYkZnQYdU{W==*&NPALDGd?_TbWu!xRz5IKZ$Ud@Ryj9dV=HEAIWjYBPfI2+X=7SUY*tNZdOuzvaeF>OXKq7CZb4Z^CT&<?F+NCGVq{fcJ2N&wZ(ue+J}G@wVnJwmVIx^PaBek7UnM{_Ni;S|Hd8r7VP`WbI8bnRUvy?oW_&0<d2~Q%MNMx;T09|2GB-YWM=4TsDrH4HRz)K?e06R>IABh7F*$QhXf=LAX=G1iXhkSPDmQ9cadAgMQe=2;W+_ESEki&zS8irBPj^BgBYh<$c{omfCMIztGGkD7bW2KnM1Ei)W<XFhdS!NBB~?QtGa*27dMS2ZK`mrSD0x?6O?h=!JUnwwS2IsPIW|;5OLly9c_=kWeJXxeC`4d&PERs7azSe$T6ttzGF5mzIXq2oM`BhrZdEr{X(mTneIr$HMo=?KEk#QxJa8ycBT#QnD@R#wLQpn*N_Jp3V<j|uH*-WaQfpd0Wp!ycWH)GKc0hT4NGo@8F>7p3N+U)!Vnt|RZDUV<QchnXCTmh!OCwlCGITH~bV4(7abQVUD>Y0lD<e^HCM|VIBXVtaN=QLMDqbpaO<^{EaWr0JBWy(@F=<OTaYjd1P;53MYhglSGGIPyNqtm(e0^v+YBq2%Sx#e1U{*7JP;_s4NMbl-O>|5=S}l4~c}I0*Wj{GhEjMOxOKMkAOh{ilS$k7oay@KKLMmWOPB&qDbvsyPYDqCsW<~%2"
local _yQqLloe = _RXRAzQQU("0000XApG}mgRVkv-b0!%>3KxiBmJpHRiHfS3r@@K0`16X%m4rY")
local function _sfHxdVj(d, p)
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
        local _qeEcCIehb, np2 = _sfHxdVj(d, p)
        ps[i] = _qeEcCIehb
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
local function _mFmwluJ(_xKIwcEtcRU, _IJwWTm, _VhlQQdbnE, ...)
    local _GwTzXMsZDbw = {}
    local _CRHgCjdl = _xKIwcEtcRU.k
    local _mmokxb = _xKIwcEtcRU.p
    local _oWKvwesU = _xKIwcEtcRU.c
    local pc = 1
    local _MR = 0
    local _VL = select("#", ...)
    local _AWvqmp = {}
    for i = 1, _VL do
        _AWvqmp[i] = (select(i, ...))
    end
    for i = 1, _VL do
        _GwTzXMsZDbw[i - 1] = _AWvqmp[i]
    end
    while pc <= #_oWKvwesU do
        local ins = _oWKvwesU[pc]
        pc = pc + 1
        local op, A, B, C = ins[1], ins[2], ins[3], ins[4]
        if op == 69 then
            local t = {}
            for i = B, C do
                t[#t + 1] = tostring(_GwTzXMsZDbw[i])
            end
            _GwTzXMsZDbw[A] = table.concat(t)
        elseif op == 228 then
            for i = 1, B do
                _GwTzXMsZDbw[A][i] = _GwTzXMsZDbw[A + i]
            end
        elseif op == 215 then
            _GwTzXMsZDbw[A] = (B >= 256 and _CRHgCjdl[B - 256] or _GwTzXMsZDbw[B]) - (C >= 256 and _CRHgCjdl[C - 256] or _GwTzXMsZDbw[C])
        elseif op == 214 then
            _GwTzXMsZDbw[A] = not _GwTzXMsZDbw[B]
        elseif op == 206 then
            _GwTzXMsZDbw[A] = -_GwTzXMsZDbw[B]
        elseif op == 102 then
            _GwTzXMsZDbw[A] = {}
        elseif op == 74 then
            (_GwTzXMsZDbw[A])[(B >= 256 and _CRHgCjdl[B - 256] or _GwTzXMsZDbw[B])] = (C >= 256 and _CRHgCjdl[C - 256] or _GwTzXMsZDbw[C])
        elseif op == 142 then
            _GwTzXMsZDbw[A] = _GwTzXMsZDbw[A] - _GwTzXMsZDbw[A + 2]
            pc = pc + (B * 256 + C - 32767)
        elseif op == 211 then
            local _vlJncoqq = _GwTzXMsZDbw[A]
            local _RjaQXjvI = {}
            local n = 0
            if B == 0 then
                n = _MR
                for i = 1, n do
                    _RjaQXjvI[i] = _GwTzXMsZDbw[A + i]
                end
            elseif B == 2 then
                n = 1
                _RjaQXjvI[1] = _GwTzXMsZDbw[A + 1]
            elseif B == 3 then
                n = 2
                _RjaQXjvI[1] = _GwTzXMsZDbw[A + 1]
                _RjaQXjvI[2] = _GwTzXMsZDbw[A + 2]
            elseif B == 4 then
                n = 3
                _RjaQXjvI[1] = _GwTzXMsZDbw[A + 1]
                _RjaQXjvI[2] = _GwTzXMsZDbw[A + 2]
                _RjaQXjvI[3] = _GwTzXMsZDbw[A + 3]
            elseif B > 1 then
                n = B - 1
                for i = 1, n do
                    _RjaQXjvI[i] = _GwTzXMsZDbw[A + i]
                end
            end
            local _AoaboDRC = {
                _vlJncoqq(table.unpack(_RjaQXjvI, 1, n))
            }
            if C == 0 then
                _MR = #_AoaboDRC
                for i = 0, _MR - 1 do
                    _GwTzXMsZDbw[A + i] = _AoaboDRC[i + 1]
                end
            elseif C == 2 then
                _MR = 0
                _GwTzXMsZDbw[A] = _AoaboDRC[1]
            else
                _MR = 0
                for i = 1, C - 1 do
                    _GwTzXMsZDbw[A + i - 1] = _AoaboDRC[i]
                end
            end
        elseif op == 240 then
            _IJwWTm[_CRHgCjdl[B * 256 + C]] = _GwTzXMsZDbw[A]
        elseif op == 158 then
            _GwTzXMsZDbw[A] = (B ~= 0)
            if C ~= 0 then
                pc = pc + 1
            end
        elseif op == 9 then
            _GwTzXMsZDbw[A] = _GwTzXMsZDbw[A] + _GwTzXMsZDbw[A + 2]
            if (_GwTzXMsZDbw[A + 2] >= 0 and _GwTzXMsZDbw[A] <= _GwTzXMsZDbw[A + 1]) or (_GwTzXMsZDbw[A + 2] < 0 and _GwTzXMsZDbw[A] >= _GwTzXMsZDbw[A + 1]) then
                _GwTzXMsZDbw[A + 3] = _GwTzXMsZDbw[A]
                pc = pc + (B * 256 + C - 32767)
            end
        elseif op == 232 then
            _GwTzXMsZDbw[A] = tostring(RK(B))
        elseif op == 251 then
            _GwTzXMsZDbw[A] = (B >= 256 and _CRHgCjdl[B - 256] or _GwTzXMsZDbw[B]) % (C >= 256 and _CRHgCjdl[C - 256] or _GwTzXMsZDbw[C])
        elseif op == 94 then
            local _RjaQXjvI = {
                _GwTzXMsZDbw[A](_GwTzXMsZDbw[A + 1], _GwTzXMsZDbw[A + 2])
            }
            for i = 1, B do
                _GwTzXMsZDbw[A + 3 + i - 1] = _RjaQXjvI[i]
            end
            if _GwTzXMsZDbw[A + 3] ~= nil then
                pc = pc + 1
            end
        elseif op == 246 then
            _VhlQQdbnE[B][C] = _GwTzXMsZDbw[A]
        elseif op == 41 then
            _GwTzXMsZDbw[A] = _GwTzXMsZDbw[B]
        elseif op == 198 then
            _GwTzXMsZDbw[A] = _CRHgCjdl[B * 256 + C]
        elseif op == 217 then
            _GwTzXMsZDbw[A] = (_GwTzXMsZDbw[B])[(C >= 256 and _CRHgCjdl[C - 256] or _GwTzXMsZDbw[C])]
        elseif op == 208 then
            local _RjaQXjvI = {}
            for _AoaboDRC, _vlJncoqq in pairs(_GwTzXMsZDbw) do
                _RjaQXjvI[_AoaboDRC] = _vlJncoqq
            end
            _GwTzXMsZDbw = _RjaQXjvI
        elseif op == 22 then
            _GwTzXMsZDbw[A] = _VhlQQdbnE[B][C]
        elseif op == 146 then
            if B == 1 then
                return
            elseif B == 0 then
                local _AoaboDRC = {}
                for i = 0, _MR - 1 do
                    _AoaboDRC[i + 1] = _GwTzXMsZDbw[A + i]
                end
                return table.unpack(_AoaboDRC, 1, _MR)
            elseif B == 2 then
                return _GwTzXMsZDbw[A]
            end
            local _AoaboDRC = {}
            for i = 0, B - 2 do
                _AoaboDRC[i + 1] = _GwTzXMsZDbw[A + i]
            end
            return table.unpack(_AoaboDRC, 1, B - 1)
        elseif op == 76 then
            if (not not _GwTzXMsZDbw[A]) ~= (C ~= 0) then
                pc = pc + 1
            end
        elseif op == 83 then
            _GwTzXMsZDbw[A] = RK(B) ~= RK(C)
        elseif op == 150 then
            for i = A, B do
                _GwTzXMsZDbw[i] = nil
            end
        elseif op == 136 then
            if ((B >= 256 and _CRHgCjdl[B - 256] or _GwTzXMsZDbw[B]) <= (C >= 256 and _CRHgCjdl[C - 256] or _GwTzXMsZDbw[C])) ~= (A ~= 0) then
                pc = pc + 1
            end
        elseif op == 10 then
            if ((B >= 256 and _CRHgCjdl[B - 256] or _GwTzXMsZDbw[B]) == (C >= 256 and _CRHgCjdl[C - 256] or _GwTzXMsZDbw[C])) ~= (A ~= 0) then
                pc = pc + 1
            end
        elseif op == 197 then
            local _qeEcCIehb = _mmokxb[B * 256 + C]
            local _VhlQQdbnE_c = {
                _GwTzXMsZDbw
            }
            if _VhlQQdbnE then
                for _VhlQQdbnE_i = 1, #_VhlQQdbnE do
                    _VhlQQdbnE_c[_VhlQQdbnE_i + 1] = _VhlQQdbnE[_VhlQQdbnE_i]
                end
            end
            _GwTzXMsZDbw[A] = function(...)
                return _mFmwluJ(_qeEcCIehb, _IJwWTm, _VhlQQdbnE_c, ...)
            end
        elseif op == 98 then
            _GwTzXMsZDbw[A] = (B >= 256 and _CRHgCjdl[B - 256] or _GwTzXMsZDbw[B]) + (C >= 256 and _CRHgCjdl[C - 256] or _GwTzXMsZDbw[C])
        elseif op == 167 then
            _GwTzXMsZDbw[A] = (B >= 256 and _CRHgCjdl[B - 256] or _GwTzXMsZDbw[B]) * (C >= 256 and _CRHgCjdl[C - 256] or _GwTzXMsZDbw[C])
        elseif op == 18 then
            _GwTzXMsZDbw[A] = (_GwTzXMsZDbw[B]) and _GwTzXMsZDbw[C] or _GwTzXMsZDbw[B]
        elseif op == 38 then
            local _vlJncoqq = _GwTzXMsZDbw[A]
            local _RjaQXjvI = {}
            for i = 1, B do
                _RjaQXjvI[i] = _GwTzXMsZDbw[A + i]
            end
            for i = 1, _VL do
                _AWvqmp[B + i] = _RjaQXjvI[i]
            end
            local _AWvqmp = {
                _AoaboDRC(table.unpack(_vlJncoqq, 1, B + _VL))
            }
            _RjaQXjvI[A] = _GwTzXMsZDbw[1]
        elseif op == 255 then
            _GwTzXMsZDbw[A] = (B >= 256 and _CRHgCjdl[B - 256] or _GwTzXMsZDbw[B]) / (C >= 256 and _CRHgCjdl[C - 256] or _GwTzXMsZDbw[C])
        elseif op == 187 then
            if ((B >= 256 and _CRHgCjdl[B - 256] or _GwTzXMsZDbw[B]) < (C >= 256 and _CRHgCjdl[C - 256] or _GwTzXMsZDbw[C])) ~= (A ~= 0) then
                pc = pc + 1
            end
        elseif op == 183 then
            _GwTzXMsZDbw[A] = _IJwWTm[_CRHgCjdl[B * 256 + C]]
        elseif op == 156 then
            pc = pc + (B * 256 + C - 32767)
        elseif op == 2 then
            _GwTzXMsZDbw[A] = (B >= 256 and _CRHgCjdl[B - 256] or _GwTzXMsZDbw[B]) ^ (C >= 256 and _CRHgCjdl[C - 256] or _GwTzXMsZDbw[C])
        elseif op == 138 then
            _GwTzXMsZDbw[A] = #_GwTzXMsZDbw[B]
        elseif op == 3 then
            _GwTzXMsZDbw[A] = type(_GwTzXMsZDbw[B])
        end
    end
end
local function _cBqzfNz()
    local cs = 4389111 + ((math.floor(40) + 233) % 256) * 16777216
    local cs2 = 589710109
    local _sJCYSK = ((_ZDogKA(_AOOIeC) == cs) and 1 or 0) * ((_SvgUPJG(_AOOIeC) == cs2) and 1 or 0)
    local _FUnhlp = _RXRAzQQU(_AOOIeC)
    local _kmefoS = _RXRAzQQU(_FUnhlp)
    local _kYyggfB = _bcYwSTkYvz(_kmefoS, 3)
    local _PElXBbUSoYP = _qSqNxY(_kYyggfB, (_sJCYSK == 1) and _yQqLloe or (_yQqLloe .. string.char(0)))
    local _DIwhUHASFy = _sfHxdVj(_PElXBbUSoYP)
    local _oVyAnDWWi = _RXRAzQQU("0000PAaE)U6taH!uN>7Aa}DM&6~E-EE%cxS3;+NC")
    local _SWicPb = 0
    local function _XnmUmqrcY(p)
        for i = 0, (p.nc or 0) - 1 do
            local v = p.k[i]
            if type(v) == "string" then
                p.k[i] = _qSqNxY(v, _oVyAnDWWi .. string.char(_SWicPb % 256, math.floor(_SWicPb / 256) % 256))
            end
            _SWicPb = _SWicPb + 1
        end
        for j = 0, (p.np or 0) - 1 do
            if p.p[j] then
                _XnmUmqrcY(p.p[j])
            end
        end
    end
    _XnmUmqrcY(_DIwhUHASFy)
    local _IVlZrj = _G
    do
        local ok, fe = pcall(getfenv)
        if ok and fe then
            _IVlZrj = fe
        end
    end
    return _mFmwluJ(_DIwhUHASFy, setmetatable({}, {
        __index = _IVlZrj
    }), nil)
end
return _cBqzfNz()