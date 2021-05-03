class DnDUser{

  final String uid;
  final String name;
  final bool dm;
  final bool homebrew;
  final int frontCol;
  final int backCol;
  final int textCol;
  final String favClass;
  final String edition;
  List matchArr;
  List possibleMatches;
  String discord;

  DnDUser({this.uid, this.name, this.dm, this.homebrew, this.frontCol, this.backCol, this.textCol, this.favClass, this.edition, this.matchArr, this.possibleMatches, this.discord});

}