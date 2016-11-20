void createOctalIndices(String filename,int firstIndex,int lastIndex){
  String[] octalIndicesLocal = {};
  String[] decimalIndicesLocal = {};
  String[] binaryIndicesLocal = {};
  for(int bullshitIndex = firstIndex;bullshitIndex <= lastIndex;bullshitIndex++){
    octalIndicesLocal = append(octalIndicesLocal,int2octal(bullshitIndex));
    decimalIndicesLocal = append(decimalIndicesLocal,int2decimal(bullshitIndex));
  }
  saveStrings(filename, octalIndicesLocal);  
  saveStrings("dec" + filename, decimalIndicesLocal);  

}

String int2octal(int localByte){
   int ones  = localByte%8;
   int eights = (localByte>>3)&7;
   int sixtyfours = (localByte>>6)&7;
   String localString = "";
   localString += "0";
   localString += char(sixtyfours + 060);
   localString += char(eights + 060);
   localString += char(ones + 060);
   return localString;
}

String int2decimal(int localByte){
   int ones  = localByte%10;
   int tens = int((localByte%100)/10);
   int hundreds = localByte - (localByte%100);
   String localString = "";
   localString += char(hundreds + 060);
   localString += char(tens + 060);
   localString += char(ones + 060);
   return localString;    
}