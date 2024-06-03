class Employee {
  String? nric4Digit;
  String? name;
  String? manpowerId;
  String? designation;
  String? project;
  String? team;
  String? supervisor;
  String? joinDate;
  String? resignDate;

  Employee(
      {this.nric4Digit,
      this.name,
      this.manpowerId,
      this.designation,
      this.project,
      this.team,
      this.supervisor,
      this.joinDate,
      this.resignDate});

  factory Employee.fromMap(Map<String, dynamic> json) => Employee(
        nric4Digit: json['nric4Digit'],
        name: json['name'],
        manpowerId: json['manpowerId'],
        designation: json['designation'],
        project: json['project'],
        team: json['team'],
        supervisor: json['supervisor'],
        joinDate: json['joinDate'],
        resignDate: json['resignDate'],
      );

  Map<String, dynamic> toMap() => {
        "nric4Digit": nric4Digit,
        "name": name,
        "manpowerId": manpowerId,
        "designation": designation,
        "project": project,
        "team": team,
        "supervisor": supervisor,
        "joinDate": joinDate,
        "resignDate": resignDate,
      };
}
