??    ?      ?  ?   |	      ?     ?  L   ?  K     ?   d  u   "  ?   ?  ?   *  k   ?  }   7  [   ?  ?        ?  9   ?  3   ?  4   !  (   V          ?  !   ?     ?     ?     ?     ?  	          	   2     <     W     j     ~  (   ?     ?     ?     ?          5     N     l     ?  &   ?  *   ?     ?  
     D     C   U  +   ?  &   ?  ,   ?       :   5  1   p  9   ?  6   ?       "   -  !   P     r  )   ?     ?     ?  %   ?  #   
  +   .  +   Z  1   ?  1   ?  %   ?  +     1   <  1   n  %   ?  $   ?  /   ?          3     N     g  .   |  +   ?     ?     ?       #   '  7   K  !   ?  !   ?  5   ?  "   ?  +         L  0   g     ?     ?  "   ?     ?       )   #     M     j     ?     ?  %   ?  &   ?               *  !   6  ;   X     ?  +   ?  /   ?          &     >     U     q     ?     ?  !   ?  !   ?        &   %   2   L   2      2   ?   0   ?   ,   !     C!  )   ]!     ?!     ?!     ?!  5   ?!  $   "  -   8"  ;   f"  $   ?"  /   ?"  	   ?"     #     	#     #     (#     7#     O#     j#      #     ?#     ?#  G  ?#     %  U   %  T   l%  ?   ?%  ~   ?&  ?   '  ?   ?'  o   f(  ?   ?(  g   g)  ?   ?)     }*  B   ?*  5   ?*  :   +  9   N+     ?+     ?+  $   ?+     ?+     ?+     ?+     ,     #,     /,     N,     Z,     y,     ?,  !   ?,  9   ?,     -  "   -  ,   ;-     h-     ?-     ?-     ?-     ?-  4   ?-  2   ".     U.  
   g.  Z   r.  Q   ?.  )   /  $   I/  2   n/     ?/  B   ?/  9   0  A   >0  >   ?0     ?0  (   ?0  !   1     )1  )   E1  (   o1     ?1  !   ?1  )   ?1  )   ?1  .   $2  9   S2  /   ?2  %   ?2  ,   ?2  :   3  0   K3  6   |3  0   ?3  I   ?3     .4     C4     [4      x4  ;   ?4  <   ?4     5      ,5  &   M5  /   t5  @   ?5  5   ?5     6  5   :6     p6  3   ?6  /   ?6  I   ?6     97      U7  .   v7     ?7  +   ?7  +   ?7     8  !   /8     Q8     q8  9   ?8  3   ?8     ?8     9     +9  0   ;9  E   l9     ?9  8   ?9  <   :  #   B:  #   f:  "   ?:  !   ?:     ?:      ?:      ;  )   .;  )   X;  +   ?;  :   ?;  ,   ?;  ,   <  ,   C<  *   p<  $   ?<     ?<  )   ?<  *   =  -   -=  $   [=  Z   ?=  8   ?=  <   >  L   Q>  6   ?>  <   ?>     ?  	   !?     +?     <?     N?     _?     v?     ??     ??     ??     ??     1       ?           L   _       ,      8      |   (   }      &       9         ?   {   e       Q           ?   ?   u   +      ;   ?       %       X   ?   !   H   ]   m   *              q                 ?   	       6   z   n       -          ?   =           E       ?           #               T   w              `   ?   A                           5   ?   R   y   G   F   I   ?           .   C   7   S          h   ?   \   ?   )   4   ^           '   ?   ?   ?         ?      g      i       ?   "   r   Z   0   @               ?   ?       Y           <   D   x         [       o   k       c       j   ?   >           U   J   b   t   N   :             d   ~   v               
               V   3      O   ?       $          /   a          ?   s   P   f   p      W         K          B      2       M   l       
 
  For the options above, The following values are supported for "ARCH":
    
  For the options above, the following values are supported for "ABI":
    
  cp0-names=ARCH           Print CP0 register names according to
                           specified architecture.
                           Default: based on binary being disassembled.
 
  fpr-names=ABI            Print FPR names according to specified ABI.
                           Default: numeric.
 
  gpr-names=ABI            Print GPR names according to  specified ABI.
                           Default: based on binary being disassembled.
 
  hwr-names=ARCH           Print HWR names according to specified 
			   architecture.
                           Default: based on binary being disassembled.
 
  reg-names=ABI            Print GPR and FPR names according to
                           specified ABI.
 
  reg-names=ARCH           Print CP0 register and HWR names according to
                           specified architecture.
 
The following ARM specific disassembler options are supported for use with
the -M switch:
 
The following MIPS specific disassembler options are supported for use
with the -M switch (multiple options should be separated by commas):
 # <dis error: %08x> # internal disassembler error, unrecognised modifier (%c) # internal error, incomplete extension sequence (+) # internal error, undefined extension sequence (+%c) # internal error, undefined modifier(%c) $<undefined> %02x		*unknown* %operator operand is not a symbol %s: Error:  %s: Warning:  (DP) offset out of range. (SP) offset out of range. (unknown) *unknown operands type: %d* *unknown* 21-bit offset out of range <function code %d> <illegal precision> <internal disassembler error> <internal error in opcode table: %s %s>
 <unknown register %d> Address 0x%s is out of bounds.
 Attempt to find bit index of 0 Bad case %d (%s) in %s:%d
 Bad immediate expression Bad register in postincrement Bad register in preincrement Bad register name Byte address required. - must be even. Don't know how to specify # dependency %s
 Don't understand 0x%x 
 Hmmmm 0x%x IC note %d for opcode %s (IC:%s) conflicts with resource %s note %d
 IC note %d in opcode %s (IC:%s) conflicts with resource %s note %d
 IC:%s [%s] has no terminals or sub-classes
 IC:%s has no terminals or sub-classes
 Illegal limm reference in last instruction!
 Internal disassembler error Internal error:  bad sparc-opcode.h: "%s", %#.8lx, %#.8lx
 Internal error: bad sparc-opcode.h: "%s" == "%s"
 Internal error: bad sparc-opcode.h: "%s", %#.8lx, %#.8lx
 Internal: Non-debugged code (test-case missing): %s:%d Label conflicts with `Rx' Label conflicts with register name No relocation for small immediate Operand is not a symbol Small operand was not an immediate number Syntax error: No trailing ')' Unknown error %d
 Unrecognised disassembler option: %s
 Unrecognised register name set: %s
 Unrecognized field %d while building insn.
 Unrecognized field %d while decoding insn.
 Unrecognized field %d while getting int operand.
 Unrecognized field %d while getting vma operand.
 Unrecognized field %d while parsing.
 Unrecognized field %d while printing insn.
 Unrecognized field %d while setting int operand.
 Unrecognized field %d while setting vma operand.
 W keyword invalid in FR operand slot. Warning: rsrc %s (%s) has no chks%s
 attempt to set y bit when using + or - modifier bad instruction `%.50s' bad instruction `%.50s...' branch operand unaligned branch to odd offset branch value not in range and to an odd offset branch value not in range and to odd offset branch value out of range can't cope with insert %d
 can't find %s for reading
 can't find ia64-ic.tbl for reading
 cgen_parse_address returned a symbol. Literal required. class %s is defined but not used
 displacement value is not aligned displacement value is not in range and is not aligned displacement value is out of range don't know how to specify %% dependency %s
 ignoring invalid mfcr mask ignoring least significant bits in branch offset illegal bitmask illegal use of parentheses immediate value cannot be register immediate value is out of range immediate value must be even immediate value not in range and not even immediate value out of range index register in load range invalid conditional option invalid mask field invalid register for stack adjustment invalid register operand when updating jump hint unaligned junk at end of line missing `)' missing mnemonic in syntax string most recent format '%s'
appears more restrictive than '%s'
 multiple note %s not handled
 no insns mapped directly to terminal IC %s
 no insns mapped directly to terminal IC %s [%s] offset greater than 124 offset greater than 248 offset greater than 62 offset not a multiple of 16 offset not a multiple of 2 offset not a multiple of 4 offset not a multiple of 8 offset not between -2048 and 2047 offset not between -8192 and 8191 offset(IP) is not a valid form opcode %s has no class (ops %d %d %d)
 operand out of range (%ld not between %ld and %ld) operand out of range (%ld not between %ld and %lu) operand out of range (%lu not between %lu and %lu) operand out of range (%lu not between 0 and %lu) operand out of range (not between 1 and 255) overlapping field %s->%s
 overwriting note %d with note %d (IC:%s)
 parse_addr16: invalid opindex. register number must be even rsrc %s (%s) has no regs
 source and target register operands must be different source register operand must be even syntax error (expected char `%c', found `%c') syntax error (expected char `%c', found end of instruction) target register operand must be even unable to change directory to "%s", errno = %s
 undefined unknown unknown	0x%02x unknown	0x%04lx unknown	0x%04x unknown constraint `%c' unknown operand shift: %x
 unknown pop reg: %d
 unrecognized form of instruction unrecognized instruction value out of range Project-Id-Version: opcodes 2.15.96
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2005-03-05 20:32+1030
PO-Revision-Date: 2005-09-13 18:42-0500
Last-Translator: Kevin Patrick Scannell <scannell@SLU.EDU>
Language-Team: Irish <ga@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
 
 
  Le haghaidh na roghanna thuas, taca?tear leis na luachanna a leanas ar "ARCH":
    
  Le haghaidh na roghanna thuas, taca?tear leis na luachanna a leanas ar "ABI":
    
  cp0-names=AILTIREACHT  Taispe?in ainmneacha na dtaibhle CP0 de r?ir na
                         hailtireachta sonraithe.
                         R?amhshocr?: bunaithe ar chl?r d?n?rtha d?olaimithe.
 
  fpr-names=ABI          Taispe?in ainmneacha FPR de r?ir an ABI sonraithe.
                         R?amhshocr?: uimhri?il.
 
  gpr-names=ABI          Taispe?in ainmneacha GPR de r?ir an ABI sonraithe.
                         R?amhshocr?: bunaithe ar chl?r d?n?rtha d?olaimithe.
 
  hwr-names=AILTIREACHT  Taispe?in ainmneacha HWR de r?ir na
                         hailtireachta sonraithe.
                         R?amhshocr?: bunaithe ar chl?r d?n?rtha d?olaimithe.
 
  reg-names=ABI          Taispe?in ainmneacha GPR agus FPR de r?ir an
                         ABI sonraithe.
 
  reg-names=AILTIREACHT  Taispe?in ainmneacha HWR agus ainmneacha na dtaibhle
                         CP0 de r?ir na hailtireachta sonraithe.
 
Taca?tear leis na roghanna a leanas, at? saini?il do ARM agus le h?s?id in ?ineacht
leis an rogha -M:
 
Taca?tear leis na roghanna d?dh?olam?ra a leanas, at? saini?il do MIPS
agus le h?s?id in ?ineacht leis an rogha -M (ba ch?ir roghanna iomad?la
a bheith scartha le cam?ga):
 # <earr?id d?dh?olama: %08x> # earr?id inmhe?nach d?dh?olam?ra, mionathraitheoir anaithnid (%c) # earr?id inmhe?nach, seicheamh neamhioml?n s?nte (+) # earr?id inmhe?nach, seicheamh s?nte gan sainmh?ni? (+%c) # earr?id inmhe?nach, mionathraitheoir gan sainmh?ni?(%c) $<gan sainmh?ni?> %02x		*anaithnid* n? siombail ? oibreann an %oibreora" %s: Earr?id:  %s: Rabhadh:  frith?ireamh (DP) as raon. frith?ireamh (SP) as raon. (anaithnid) *cine?l anaithnid oibrinn: %d* *anaithnid* frith?ireamh 21-giot?n as raon <c?d feidhme %d> <beachtas neamhcheadaithe> <earr?id inmhe?nach d?dh?olam?ra> <earr?id inmhe?nach sa t?bla de ch?id oibr?ochta: %s %s>
 <tabhall anaithnid %d> T? an seoladh 0x%s thar teorainn.
 Rinneadh iarracht inn?acs giot?in 0 a aimsi? Droch-ch?s %d (%s) i %s:%d
 Drochshlonn l?ithreach Drochthabhall i iarincrimint Drochthabhall i r?amhincrimint Drochainm ar thabhall Seoladh birt de dh?th. - n? m?r d? a bheith cothrom. N?l fhios agam conas a shonra?tear sple?chas # %s
 N? thuigim 0x%x 
 Hmmmm 0x%x N?ta IC %d le haghaidh c?id oibr?ochta %s (IC:%s) i gcoinbhleacht le hacmhainn %s n?ta %d
 N?ta IC %d sa ch?d oibr?ochta %s (IC:%s) i gcoinbhleacht le hacmhainn %s n?ta %d
 n?l teirmin?il n? fo-aicm? ag IC:%s [%s]
 N?l teirmin?il n? fo-aicm? ag IC:%s
 Tagairt neamhcheadaithe limm sa treoir is d?ana?!
 Earr?id inmhe?nach d?dh?olam?ra Earr?id inmhe?nach:  sparc-opcode.h go holc: "%s", %#.8lx, %#.8lx
 Earr?id inmhe?nach: sparc-opcode.h go holc: "%s" == "%s"
 Earr?id inmhe?nach: sparc-opcode.h go holc: "%s", %#.8lx, %#.8lx
 Inmhe?nach: c?d gan d?fhabht? (c?s t?st?la ar iarraidh): %s:%d Lip?ad i gcoinbhleacht le `Rx' Lip?ad i gcoinbhleacht le hainm tabhaill Luach beag l?ithreach gan athshu? N? siombail ? an t-oibreann N? uimhir l?ithreach ? an t-oibreann beag Earr?id chomhr?ire: gan ')' chun deiridh Earr?id anaithnid %d
 Rogha anaithnid d?dh?olam?ra: %s
 Tacar anaithnid d'ainmneacha taibhle: %s
 R?imse anaithnid %d le linn t?g?la insn.
 R?imse anaithnid %d le linn d?ch?daithe insn.
 R?imse anaithnid %d agus oibreann sl?nuimhri?il ? fh?il.
 R?imse anaithnid %d agus oibreann vma ? fh?il.
 R?imse anaithnid %d le linn pars?la.
 R?imse anaithnid %d le linn priont?la insn.
 R?imse anaithnid %d agus oibreann sl?nuimhri?il ? shocr?.
 R?imse anaithnid %d agus oibreann vma ? shocr?.
 is neamhbhail? ? eochairfhocal W i sliot?n oibrinn FR. Rabhadh: n?l aon srian ar an acmhainn %s (%s)%s
 rinneadh iarracht y-giot?n a shocr? agus mionathraitheoir + n? - in ?s?id drochthreoir `%.50s' drochthreoir `%.50s...' oibreann brainse gan ail?ni? brainse go dt? frith?ireamh corr luach brainse as raon agus brainse go dt? frith?ireamh corr luach brainse as raon, agus brainse go dt? frith?ireamh corr luach an bhrainse as raon n? f?idir d?ile?il le hions? %d
 n? f?idir %s a oscailt chun ? a l?amh
 n? f?idir ia64-ic.tbl a oscailt chun ? a l?amh
 d'fhill cgen_parse_address siombail. T? g? le teaghr?n litri?il. sainmh?n?odh an aicme %s, ach n?or baineadh ?s?id as
 luach d?l?ithrithe gan ail?ni? t? an luach d?l?ithrithe as raon, agus n? ail?nithe ? luach d?l?ithrithe as raon n?l fhios agam conas a shonra?tear sple?chas %% %s
 ag d?anamh neamhshuim ar mhasc neamhbhail? mfcr ag d?anamh neamhshuim ar na giot?in is l? suntas i bhfrith?ireamh brainse giot?nmhasc neamhcheadaithe ?s?id neamhcheadaithe de l?ib?n? n? f?idir an luach l?ithreach a bheith tabhall luach l?ithreach as raon caithfidh luach l?ithreach a bheith cothrom luach l?ithreach as raon, agus n? cothrom ? luach l?ithreach as raon tabhall inn?acs i raon luchtaithe rogha neamhbhail? choinn?ollach r?imse neamhbhail? maisc tabhall neamhbhail? le haghaidh coigeartaithe na cruaiche oibreann neamhbhail? tabhaill le linn nuashonraithe leid l?ime gan ail?ni? bruscar ag deireadh na l?ne `)' ar iarraidh cuimhneola?och ar iarraidh i dteaghr?n comhr?ire is cos?il go bhfuil an fhorm?id is
d?ana? '%s' n?os srianta? n? '%s'
 iln?ta %s gan l?imhse?il
 n?l aon insn map?ilte go d?reach go IC teirmin?alach %s
 n?l aon insn map?ilte go d?reach go IC teirmin?alach %s [%s] is n?os m? n? 124 ? an frith?ireamh is n?os m? n? 248 ? an frith?ireamh is n?os m? n? 62 ? an frith?ireamh n? iolra? de 16 ? an frith?ireamh n? cothrom ? an frith?ireamh n? iolra? de 4 ? an frith?ireamh n? iolra? de 8 ? an frith?ireamh n? idir -2048 agus 2047 ? an frith?ireamh n? idir -8192 agus 8191 ? an frith?ireamh is neamhbhail? ? an fhoirm frith?ireamh(IP) n?l aicme ar bith ag c?d oibr?ochta %s (oibrinn %d %d %d)
 oibreann as raon (n?l %ld idir %ld agus %ld) oibreann as raon (n?l %ld idir %ld agus %lu) oibreann as raon (n?l %lu idir %lu agus %lu) oibreann as raon (n?l %lu idir 0 agus %lu) oibreann as raon (n? idir 1 agus 255 r?imse forluite %s->%s
 n?ta %d ? fhorscr?obh le n?ta %d (IC:%s)
 parse_addr16: inn?acs neamhbhail? oibrinn. caithfidh uimhir an tabhaill a bheith cothrom n?l aon tabhall ag acmhainn %s (%s)
 caithfidh oibreann an tabhaill foinsigh agus oibreann an spriocthabhaill a bheith difri?il caithfidh oibreann an tabhaill foinsigh a bheith cothrom earr?id chomhr?ire (bh?othas ag s?il le `%c', fuarthas `%c') earr?id chomhr?ire (bh?othas ag s?il le `%c', fuarthas deireadh na treorach) caithfidh oibreann an spriocthabhaill a bheith cothrom n? f?idir an chomhadlann reatha a athr? go "%s", errno = %s
 gan sainmh?ni? anaithnid anaithnid	0x%02x anaithnid	0x%04lx anaithnid	0x%04x iallach anaithnid `%c' iomlaoid anaithnid oibrinn: %x
 tabhall anaithnid plobtha: %d
 foirm anaithnid de threoir treoir anaithnid luach as raon 