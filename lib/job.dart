class Job {
  final String title;
  final String description;

  Job(this.title, this.description);

  @override
  String toString() {
    return "${this.title} - ${this.description}";
  }
}
