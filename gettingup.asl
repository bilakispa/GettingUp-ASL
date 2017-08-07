state("GettingUp") {
  byte loading: "GettingUp.exe", 0x798100;
}

isLoading {
  return current.loading != 1;
}
