??    ?      ?  ?   |	      ?     ?  L   ?  K     ?   d  u   "  ?   ?  ?   *  k   ?  }   7  [   ?  ?        ?  9   ?  3   ?  4   !  (   V          ?  !   ?     ?     ?     ?     ?  	          	   2     <     W     j     ~  (   ?     ?     ?     ?          5     N     l     ?  &   ?  *   ?     ?  
     D     C   U  +   ?  &   ?  ,   ?       :   5  1   p  9   ?  6   ?       "   -  !   P     r  )   ?     ?     ?  %   ?  #   
  +   .  +   Z  1   ?  1   ?  %   ?  +     1   <  1   n  %   ?  $   ?  /   ?          3     N     g  .   |  +   ?     ?     ?       #   '  7   K  !   ?  !   ?  5   ?  "   ?  +         L  0   g     ?     ?  "   ?     ?       )   #     M     j     ?     ?  %   ?  &   ?               *  !   6  ;   X     ?  +   ?  /   ?          &     >     U     q     ?     ?  !   ?  !   ?        &   %   2   L   2      2   ?   0   ?   ,   !     C!  )   ]!     ?!     ?!     ?!  5   ?!  $   "  -   8"  ;   f"  $   ?"  /   ?"  	   ?"     #     	#     #     (#     7#     O#     j#      #     ?#     ?#  ?  ?#     R%  ?   T%  >   ?%  ?   ?%  }   ?&  ?    '  ?   ?'  q   u(  ?   ?(  Y   k)  ?   ?)     M*  <   j*  :   ?*  ?   ?*  4   "+     W+     n+  *   ?+     ?+     ?+  &   ?+  &   ?+     ,  $   ",     G,  ,   T,     ?,     ?,     ?,  *   ?,     ?,  2   -  $   C-  /   h-  '   ?-  &   ?-  '   ?-     .  /   &.  2   V.     ?.  
   ?.  W   ?.  Y   
/  <   d/  7   ?/  2   ?/     0  D   )0  ;   n0  C   ?0  ;   ?0  )   *1  -   T1  B   ?1     ?1  6   ?1  *   2     D2  '   Y2  #   ?2  3   ?2  2   ?2  @   3  8   M3  0   ?3  2   ?3  B   ?3  :   -4  3   h4  4   ?4  =   ?4     5     '5  )   B5  )   l5  S   ?5  S   ?5  &   >6  *   e6     ?6  %   ?6  :   ?6  0   7  (   ?7  I   h7  .   ?7  3   ?7  +   8  D   A8     ?8     ?8  2   ?8  0   ?8  1   "9  E   T9  5   ?9  /   ?9      :      :  '   ::  7   b:     ?:     ?:     ?:  '   ?:  ;   ;     =;  A   ];  E   ?;     ?;     ?;     <     2<     P<     m<     ?<  *   ?<  *   ?<  #   ?<  2   !=  L   T=  L   ?=  L   ?=  J   ;>  >   ?>      ?>  2   ?>  (   ?  %   B?  ,   h?  >   ??  7   ??  :   @  C   G@  6   ?@  :   ?@     ?@  
   A     A     .A     AA     SA  %   kA     ?A     ?A     ?A     ?A     1       ?           L   _       ,      8      |   (   }      &       9         ?   {   e       Q           ?   ?   u   +      ;   ?       %       X   ?   !   H   ]   m   *              q                 ?   	       6   z   n       -          ?   =           E       ?           #               T   w              `   ?   A                           5   ?   R   y   G   F   I   ?           .   C   7   S          h   ?   \   ?   )   4   ^           '   ?   ?   ?         ?      g      i       ?   "   r   Z   0   @               ?   ?       Y           <   D   x         [       o   k       c       j   ?   >           U   J   b   t   N   :             d   ~   v               
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
PO-Revision-Date: 2005-04-13 19:40+03:00
Last-Translator: Jorma Karvonen <karvjorm@users.sourceforge.net>
Language-Team: Finnish <translation-team-fi@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Generator: KBabel 1.0.1
 
 
  Ylläolevista valinnoista "ARCH" tukee seuraavia arvoja:
    
  Ylläolevista valinnoista "ABI" tukee seuraavia arvoja:
    
  cp0-names=ARCH           Tulosta CP0-rekisterinimet
                           määritellyn arkkitehtuurin mukaisesti.
                           Oletus: perustuu disassemloitavaan binääritiedostoon.
 
  fpr-names=ABI            Tulosta FPR-nimet määritellyn ABI:n mukaisesti.
                           Oletus: numeerinen.
 
  gpr-names=ABI            Tulosta GPR-nimet määritellyn ABI:n mukaisesti.
                           Oletus: perustuu disassembloitavaan binääritiedostoon.
 
  hwr-names=ARCH           Tulosta HWR-nimet määritellyn
			   arkkitehtuurin mukaisesti.
                           Oletus: perustuu disassembloitavaan binääritiedostoon.
 
  reg-names=ABI            Tulosta GPR- ja FPR-nimet määritellyn
                           ABI:n mukaisesti.
 
  reg-names=ARCH           Tulosta CP0-rekisteri ja HWR-nimet määritellyn
                           arkkitehtuurin mukaisesti.
 
Seuraavia ARM-kohtaisia disassembler-valintoja tuetaan käytössä
-M -valinnan kanssa:
 
Seuraavat MIPS-kohtaiset disassembler-valinnat ovat tuettuja käyttöön
-M -valinnan kanssa (monivalinnat pitää erottaa pilkulla):
 # <disassembler-virhe: %08x> # sisäinen disassembler-virhe, tunnistamaton määrite (%c) # sisäinen virhe, epätäydellinen laajennussekvenssi (+) # sisäinen virhe, määrittelemätön laajennussekvenssi (+%c) # sisäinen virhe, määrittelemätön määrite(%c) $<määrittelemätön> %02x		*tuntematon* %operaattori-kohdemuuttuja ei ole symboli. %s: Virhe:  %s: Varoitus:  (DP)-siirros ei ole rajojen sisällä. (SP)-siirros ei ole rajojen sisällä. (tuntematon) *tuntematon kohdemuuttujatyyppi: %d* *tuntematon* 21-bittinen siirros ei ole rajojen sisällä <toimintakoodi %d> <virheellinen tarkkuus> <sisäinen disassembler-virhe> <sisäinen virhe käskytaulukossa: %s %s>
 <tuntematon rekisteri %d> Osoite 0x%s ei ole sallittujen rajojen sisällä.
 Yritettiin löytää 0-bitti-indeksi %d (%s) on virheellinen tapaus kohteessa %s:%d
 Virheellinen suora muistiosoituslauseke Väärä rekisteri jälkikasvatuksessa Väärä rekisteri ennakkokasvatuksessa Väärä rekisterinimi Vaaditaan tavuosoite - täytyy olla parillinen. Kohteen # riippuvuutta %s ei osattu määritellä
 0x%x ei ole ymmärrettävä 
 Hmmmm 0x%x IC-merkintä %d käskyyn %s (IC:%s) on ristiriidassa resurssin %s merkinnän %d kanssa
 IC-merkintä %d käskyssä %s (IC:%s) on ristiriidassa resurssin %s merkinnän %d kanssa
 Kohteella IC:%s [%s] ei ole päätepisteitä tai alaluokkia
 Kohteella IC:%s ei ole päätepisteitä tai alaluokkia
 Viimeisimmän käskyn virheellinen limm-viittaus!
 Sisäinen disassembler-virhe Sisäinen virhe:  virheellinen sparc-opcode.h: "%s", %#.8lx, %#.8lx
 Sisäinen virhe: virheellinen sparc-opcode.h: "%s" == "%s"
 Sisäinen virhe: virheellinen sparc-opcode.h: "%s", %#.8lx, %#.8lx
 Sisäinen: Debuggaamaton koodi (testitapaus puuttuu): %s:%d Otsikko ristiriidassa kohteen "Rx" kanssa Otsikko ristiriidassa rekisterin nimen kanssa Ei uudelleensijoitusta pienikokoiselle suoralle muistiosoitukselle Kohdemuuttuja ei ole symboli Pieni kohdemuuttuja ei ollut suora muistiosoitusnumero Syntaksivirhe: loppukaarisulku ")" puuttuu Tuntematon virhe %d
 Tunnistamaton disassembler-valinta: %s
 Tuntematon rekisterinimijoukko: %s
 Tunnistamaton kenttä %d käskyä muodostettaessa.
 Tunnistamaton kenttä %d käskyä dekoodattaessa.
 Tunnistamaton kenttä %d kokonaislukukohdemuuttujaa haettaessa.
 Tunnistamaton kenttä %d vma-kohdemuuttujaa haettaessa.
 Tunnistamaton kenttä %d jäsentämisen aikana.
 Tunnistamaton kenttä %d käskyä tulostettaessa.
 Tunnistamaton kenttä %d kokonaislukukohdemuuttujaa asetettaessa.
 Tunnistamaton kenttä %d vma-kohdemuuttujaa asetettaessa.
 avainsana W virheellinen FR-kohdemuuttujavälissä. Varoitus: kohteessa rsrc %s (%s) ei ole %s-valintaa
 yritys asettaa y-bitti kun käytetään + tai - määritettä väärä käsky "%.50s" väärä käsky "%.50s..." haaroituskohdemuuttuja ei ole tasarajalla haaroitus parittomaan siirrososoitteeseen haaroitusarvo ei ole rajojen sisällä ja sijaitsee parittomassa siirrososoitteessa haaroitusarvo ei ole rajojen sisällä ja kohdistuu parittomaan siirrososoitteeseen haaroitusarvo ei ole rajojen sisällä kohteen %d sijoittamisesta ei selviydytty
 %s ei löytynyt luettavaksi
 ia64-ic.tbl ei löytynyt luettavaksi
 cgen_parse_address palautti symbolin. Vaaditaan literaali. luokka %s on määritelty mutta käyttämätön
 uudelleensijoitusarvo ei ole tasarajalla Uudelleensijoitusarvo ei ole rajojen sisällä eikä sijaitse tasarajalla uudelleensijoitusarvo ei ole rajojen sisällä kohteen %% riippuvuutta %s ei osattu määritellä
 virheellistä mfcr-maskia ei oteta huomioon vähinten merkitseviä bittejä ei oteta huomioon haaroitussiirrossa virheellinen bittimaski sulkeiden virheellinen käyttö suoraan muistiosoitettu arvo ei voi olla rekisteri suora muistiosoitusarvo ei ole rajojen sisällä Suoran muistiosoitusarvon täytyy olla parillinen suora muistiosoitusarvo ei ole rajojen sisällä eikä ole parillinen suoraan muistiosoitettu arvo ei ole rajojen sisällä indeksirekisteri on latauslukurajojen sisällä virheellinen ehdollinen valinta virheellinen maskikenttä virheellinen rekisteri pinosäädössä rekisterin kohdemuuttuja virheellinen päivitettäessä hyppyvihje ei ole tasarajalla roskaa rivin lopussa ")" puuttuu syntaksimerkkijonosta puuttuu muistikas viimeisin muoto "%s"
näyttää rajoittavammalta kuin "%s"
 monimerkkejä %s ei käsitelty
 yhtään käskyä ei ole mapattu suoraan päätepisteeseen IC %s
 yhtään käskyä ei ole mapattu suoraan päätepisteeseen IC %s [%s] siirros suurempi kuin 124 siirros suurempi kuin 248 siirros suurempi kuin 62 siirros ei ole 16:n monikerta siirros ei ole 2:n monikerta siirros ei ole 4:n monikerta siirros ei ole 8:n monikerta siirros ei ole -2048:n ja 2047:n välillä siirros ei ole -8192:n ja 8191:n välillä siirros(IP) ei ole virheetön muoto käskyssä %s ei ole luokkaa (toiminnat %d %d %d)
 kohdemuuttuja ei ole rajojen sisällä (%ld ei ole %ld:n ja %ld:n välillä) kohdemuuttuja ei ole rajojen sisällä (%ld ei ole %ld:n ja %lu:n välillä) kohdemuuttuja ei ole rajojen sisällä (%lu ei ole %lu:n ja %lu:n välillä) kohdemuuttuja ei ole rajojen sisällä (%lu ei ole 0:n ja %lu:n välillä) kohdemuuttuja ei ole rajojen sisällä (ei välillä 1 ja 255) päällekkäinen kenttä %s->%s
 merkki %d kirjoitetaan merkin %d päälle (IC:%s)
 parse_addr16: virheellinen käskyindeksi rekisterinumeron on oltava parillinen kohteessa rsrc %s (%s) ei ole rekistereitä
 lähde- ja kohderekisterin kohdemuuttujien on oltava erilaiset lähderekisterin kohdemuuttujan täytyy olla parillinen syntaksivirhe (odotettiin merkkiä "%c", löydettiin "%c") syntaksivirhe (odotettiin merkkiä "%c", löydettiin käskyn loppu) kohderekisterin kohdemuuttujan täytyy olla parillinen vaihtaminen hakemistoon "%s" ei onnistu, virhenumero = %s
 määrittelemätön tuntematon tuntematon	0x%02x tuntematon	0x%04lx tuntematon	0x%04x tuntematon rajoite "%c" tuntematon kohdemuuttujan siirto: %x
 tuntematon pop-rekisteri: %d
 käskyn muoto tunnistamaton tunnistamaton käsky arvo ei ole rajojen sisällä 