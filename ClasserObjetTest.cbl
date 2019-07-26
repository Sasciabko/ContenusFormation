      [...]
*================================================================================
      Data division.
*   ----------------


      File section.
*     ---
    FD  Ent010 LABEL RECORD STANDARD                          
                BLOCK   CONTAINS    0 RECORDS                  
                RECORD  CONTAINS  200 CHARACTERS               
                RECORDING MODE IS   F                          
                DATA RECORD  ent-Cli.
    01 ENT-Cli.
           10 Num-Cli      pic    9(05).
           10 Nom-Cli      pic    X(20).
           10 Prn-Cli      pic    X(20).
           10 Adr-Cli      pic    X(100).
           10 Tel-Cli      pic   S9(10) COMP-3.
           10              pic    X(70).


    FD  Ent020 LABEL RECORD STANDARD                          
                BLOCK   CONTAINS    0 RECORDS                  
                RECORD  CONTAINS 2100 CHARACTERS               
                RECORDING MODE IS   F                          
                DATA RECORD ent-Cmd.


    01  Ent-Cmd.
           10 Num-Cmd      pic    9(05).
           10 Mtt-Cmd      pic    9(04)V99.
           10 Pdt-Cmd      occurs 20 times.
              20 Ref-Pdt   pic   X(15).
              20 Nom-Pdt   pic   X(25).
              20 Nbr-Pdt   pic   9(02).
              20 Prx-Pdt   pic   9(03)V99.
              20           pic   X(53).
           10              pic   X(89). 


      Working-storage section.
*     ---

*   Constance :
    01 C-NomPgm            pic  X(08)   value 'ImpFactu'.

*   Indice :
    01 Ind-Pdt-Cmd         pic  9(02).


*   Variables de travail pour l'impression du tableau des commandes :
   01 W-Pdt-Cmd.
       10 W-Ref-Pdt        pic   X(15).
       10 W-Nom-Pdt        pic   X(25).
       10 W-Nbr-Pdt        pic   9(02).
       10 W-Prx-Pdt        pic   9(03)V99.

   01 Nom-Pdf-facture      pic X(15).

      Local-storage section.
*     ---

* Variables de contrôle de flux.
    01                     pic   X(02).
      88 Trt-OK               value "OK".
      88 Trt-KO               value "KO".

    01 w-status.
      10 FS-ENT010         pic   X(02).
         88 FS-ENT010-OK      value "00".
      10 FS-ENT020         pic   X(02).
         88 FS-ENT020-OK      value "00".


*================================================================================

      Procedure division.
*   ---------------------

      Perform DEBUT
      If Trt-OK
        Perform TRAITEMENT
      end-if
      Perform FIN
      .

      DEBUT.
      [...]     

      TRAITEMENT.
      [...]

      LIT-UNE-LIGNE.
      [...]

      TRAITE-UNE-LIGNE.
      [...]
      Call SP-ImprimeFacture using Ent-Cli Ent-Cmd Nom-Pdf-facture
      end-call. 
      [...]

      CALCULE-FACTURE.
      [...]

      IMPRIME-FACTURE.
      [...]

      FIN.
      [...]

      REND-COMPTE.
      [...]
