��    �      �  �   |	      �     �  L   �  K     �   d  u   "  �   �  �   *  k   �  }   7  [   �  �        �  9   �  3   �  4   !  (   V          �  !   �     �     �     �     �  	          	   2     <     W     j     ~  (   �     �     �     �          5     N     l     �  &   �  *   �     �  
     D     C   U  +   �  &   �  ,   �       :   5  1   p  9   �  6   �       "   -  !   P     r  )   �     �     �  %   �  #   
  +   .  +   Z  1   �  1   �  %   �  +     1   <  1   n  %   �  $   �  /   �          3     N     g  .   |  +   �     �     �       #   '  7   K  !   �  !   �  5   �  "   �  +         L  0   g     �     �  "   �     �       )   #     M     j     �     �  %   �  &   �               *  !   6  ;   X     �  +   �  /   �          &     >     U     q     �     �  !   �  !   �        &   %   2   L   2      2   �   0   �   ,   !     C!  )   ]!     �!     �!     �!  5   �!  $   "  -   8"  ;   f"  $   �"  /   �"  	   �"     #     	#     #     (#     7#     O#     j#      #     �#     �#  L  �#     %  V   %  U   r%  �   �%  �   �&  �   %'  �   �'  w   �(  �   
)  p   �)  �   *  !   �*  B   �*  6   +  9   J+  ,   �+     �+     �+  &   �+     �+     ,  #   ,  #   7,     [,  -   i,     �,  '   �,     �,     �,  "   �,  ;   -     V-  -   p-  *   �-     �-     �-  %   .  $   *.     O.  2   j.  0   �.     �.  
   �.  `   �.  ^   P/  ,   �/  '   �/  2   0      70  =   X0  4   �0  <   �0  <   1  %   E1  6   k1  *   �1     �1  ,   �1  %   2     =2  +   S2  2   2  /   �2  1   �2  8   3  8   M3  7   �3  -   �3  ;   �3  ;   (4  <   d4  '   �4  C   �4     5     )5  $   H5  &   m5  J   �5  J   �5  ,   *6  !   W6  &   y6  /   �6  @   �6  )   7  )   ;7  ?   e7  ,   �7  1   �7  "   8  G   '8     o8     �8  +   �8  &   �8     �8  /   9  &   B9  $   i9     �9     �9  +   �9  5   �9     &:     A:     ]:  *   j:  =   �:  !   �:  5   �:  9   +;  "   e;  "   �;  !   �;  )   �;  (   �;  (    <  (   I<  ,   r<  ,   �<  ,   �<  8   �<  5   2=  5   h=  5   �=  3   �=  /   >     8>  2   O>  *   �>  "   �>  #   �>  A   �>  +   6?  A   b?  W   �?  -   �?  5   *@     `@     l@     x@     �@     �@     �@  +   �@     �@  "   A     <A     VA     1       �           L   _       ,      8      |   (   }      &       9         �   {   e       Q           �   �   u   +      ;   �       %       X   �   !   H   ]   m   *              q                 �   	       6   z   n       -          �   =           E       �           #               T   w              `   �   A                           5   �   R   y   G   F   I   �           .   C   7   S          h   �   \   �   )   4   ^           '   �   �   ?         �      g      i       �   "   r   Z   0   @               �   �       Y           <   D   x         [       o   k       c       j   �   >           U   J   b   t   N   :             d   ~   v               
               V   3      O   �       $          /   a          �   s   P   f   p      W         K          B      2       M   l       
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
PO-Revision-Date: 2005-03-14 17:13-0600
Last-Translator: Cristian Oth�n Mart�nez Vera <cfuga@itam.mx>
Language-Team: Spanish <es@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
 
 
  Para las opciones anteriores, se da soporte a los siguientes valores de "ARCH":
    
  Para las opciones anteriores, se da soporte a los siguientes valores de "ABI":
    
  cp0-names=ARCH           Muestra los nombres de registro CP0 de acuerdo a
                           la arquitectura especificada.
                           Por defecto: basado en el binario a desensamblar.
 
  fpr-names=ABI            Muestra los nombres FPR de acuerdo a la ABI especificada.
                           Por defecto: num�rico.
 
  gpr-names=ABI            Muestra los nombres GPR de acuerdo a la ABI especificada.
                           Por defecto: basado en el binario a desensamblar.
 
  hwr-names=ARCH           Muestra los nombres HWR de acuerdo a la arquitectura 
                           especificada.
                           Por defecto: basado en el binario a desensamblar.
 
  reg-names=ABI            Muestra los nombres GPR y FPR de acuerdo a
                           la ABI especificada.
 
  reg-names=ARCH           Muestra el registro CP0 y los nombres HWR de acuerdo a
                           la arquitectura especificada.
 
Las siguientes opciones de desensamblador espec�ficas de ARM tienen soporte
para su uso con el interruptor -M:
 
Las siguientes opciones de desensamblador espec�ficas de MIPS tienen soporte
para su uso con el interruptor -M (las opciones m�ltiples se deben separar con comas):
 # <error de desensamblador: %08x> # error interno del desensamblador, modificador (%c) no reconocido # error interno, secuencia de extensi�n incompleta (+) # error interno, secuencia de extensi�n sin definir (+%c) # error interno, modificador(%c) sin definir $<sin definir> %02x		*desconocido* el operando %operator no es un s�mbolo %s: Error:  %s: Aviso:  desplazamiento (DP) fuera de rango. desplazamiento (SP) fuera de rango. (desconocido) *tipo de operandos operandos desconocido: %d* *desconocida* desplazamiento de 21-bit fuera de rango <c�digo de funci�n %d> <precisi�n ilegal> <error interno del desensamblador> <error interno en la tabla de c�digos de operaci�n: %s %s>
 <registro %d desconocido> La direcci�n 0x%s est� fuera de los l�mites.
 Se intent� encontrar un �ndice de bit de 0 Case %d err�neo (%s) en %s:%d
 Expresi�n inmediata err�nea Registro err�neo en el postincremento Registro err�neo en el preincremento Nombre de registro err�neo Se requiere una direcci�n de byte. - debe ser par. No se sabe c�mo especificar la dependencia # %s
 No se entiende 0x%x 
 Hmmmm 0x%x la nota IC %d para el c�digo de operaci�n %s (IC:%s) tiene conflictos con el recurso %s nota %d
 la nota IC %d en el c�digo de operaci�n %s (IC:%s) tiene conflictos con el recurso %s nota %d
 IC:%s [%s] no tiene terminales o sub-clases
 IC:%s no tiene terminales o sub-clases
 �Referencia limm ilegal en la �ltima instrucci�n!
 Error interno del desensamblador Error interno:  sparc-opcode.h err�neo: "%s", %#.8lx, %#.8lx
 Error interno: sparc-opcode.h err�neo: "%s" == "%s"
 Error interno: sparc-opcode.h err�neo: "%s", %#.8lx, %#.8lx
 Interno: C�digo no depurado (falta el caso de prueba): %s:%d La etiqueta tiene conflictos con `Rx' La etiqueta tiene conflictos con el nombre de registro No hay reubicaciones para inmediatos small El operando no es un s�mbolo El operando small no era un n�mero inmediato Error sint�ctico: No hay ')' al final Error desconocido %d
 Opci�n de desensamblador no reconocida: %s
 Conjunto de nombres de registro no reconocido: %s
 No se reconoci� el campo %d al construir insn.
 No se reconoci� el campo %d al decodificar insn.
 No se reconoci� el campo %d al obtener el operando int.
 No se reconoci� el campo %d al obtener el operando vma.
 No se reconoci� el campo %d durante la decodificaci�n.
 No se reconoci� el campo %d al mostrar insn.
 No se reconoci� el campo %d al establecer el operando int.
 No se reconoci� el campo %d al establecer el operando vma.
 la palabra clave W es inv�lida en la ranura del operando FR. Aviso: el rsrc %s (%s) no tiene chks%s
 intento de establecer el bit y cuando se usaba el modificador + � - instrucci�n err�nea `%.50s' instrucci�n err�nea `%.50s...' operando de ramificaci�n sin alinear ramificaci�n a un desplazamiento impar el valor de ramificaci�n no est� en rango e indica un desplazamiento impar el valor de ramificaci�n no est� en rango e indica un desplazamiento impar el valor de ramificaci�n est� fuera de rango no se puede lidiar con insert %d
 no se puede encontrar %s para lectura
 no se puede encontrar ia64-ic.tbl para lectura
 cgen_parse_address devolvi� un s�mbolo. Se requiere una literal. se define la clase %s pero no se utiliza
 el valor de desubicaci�n no est� alineado el valor de desubicaci�n no est� en el rango y no est� alineado el valor de desubicaci�n est� fuera de rango no se sabe c�mo especificar la dependencia %% %s
 se ignora la m�scara mfcr inv�lida ignorando los bits menos significativos en el desplazamiento de la rama m�scara de bits ilegal uso ilegal de par�ntesis el valor inmediato no puede ser un registro el valor inmediato est� fuera de rango el valor inmediato debe ser par el valor inmediato no est� en rango y no es par el valor inmediato est� fuera de rango registro �ndice en el rango de carga opci�n condicional inv�lida campo de m�scara inv�lido registro inv�lido para el ajuste de la pila operando de registro inv�lido mientras se actualizaba pista de salto sin alinear basura al final de la l�nea falta un `)' falta el mnem�nico en la cadena sint�ctica el formato m�s reciente '%s'
parece m�s restrictivo que '%s'
 la nota m�ltiple %s no se maneja
 no hay insns mapeadas directamente al IC terminal %s
 no hay insns mapeadas directamente al IC terminal %s [%s] el desplazamiento es mayor que 124 el desplazamiento es mayor que 248 el desplazamiento es mayor que 62 el desplazamiento no es un m�ltiplo de 16 el desplazamiento no es un m�ltiplo de 2 el desplazamiento no es un m�ltiplo de 4 el desplazamiento no es un m�ltiplo de 8 el desplazamiento no est� entre -2048 y 2047 el desplazamiento no est� entre -8192 y 8191 el desplazamiento(IP) no es una forma v�lida el c�digo de operaci�n %s no tiene clase (ops %d %d %d)
 operando fuera de rango (%ld no est� entre %ld y %ld) operando fuera de rango (%ld no est� entre %ld y %lu) operando fuera de rango (%lu no est� entre %lu y %lu) operando fuera de rango (%lu no est� entre 0 y %lu) operando fuera de rango (no est� entre 1 y 255) campo solapado %s->%s
 se sobreescribe la nota %d con la nota %d (IC:%s)
 parse_addr16: �ndice de operador inv�lido. el n�mero de registro debe ser par el rsrc %s (%s) no tiene registros
 los operandos de registros fuente y objetivo deben ser diferentes el operando de registro fuente debe ser par error sint�ctico (se esperaba el car�cter `%c', se encontr� `%c') error sint�ctico (se esperaba el car�cter `%c', se encontr� el final de la instrucci�n) el operando de registro objetivo debe ser par no se puede cambiar el directorio a "%s", errno = %s
 sin definir desconocida desconocido	0x%02x desconocido	0x%04lx desconocido	0x%04x restricci�n `%c' desconocida operando de desplazamiento desconocido: %x
 registro pop desconocido: %d
 forma de instrucci�n no reconocida instrucci�n no reconocida valor fuera de rango 