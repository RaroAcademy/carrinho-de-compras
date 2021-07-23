enum AppStatus { success, loading, error, empty }

extension stateMessage on AppStatus {
  String message() {
    if (this == AppStatus.error) {
      return "Ops! Algo deu errado";
    }

    return "";
  }
}

extension format on double {
  String reais() {
    return "R\$ ${this.toStringAsFixed(2)}".replaceAll(".", ",");
  }
}
