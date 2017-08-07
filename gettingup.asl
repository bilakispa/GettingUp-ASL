state("GettingUp") {
  byte loading: "GettingUp.exe", 0x263D44;
  byte loading2: "GettingUp.exe", 0x263D5C;
}

isLoading {
  return (current.loading != 0) || (current.loading2 != 0);
}